<template>
  <div
    v-if="loading"
    class="w-full h-96 border rounded-lg shadow-md flex items-center justify-center col-span-2"
  >
    <radar-spinner :animation-duration="2000" :size="50" color="#b91c1c" />
  </div>
  <div v-else class="col-span-2 border rounded-lg shadow-md">
    <div class="flex justify-end w-full" v-if="user.role !== 'employee'">
      <div
        class="border grid grid-cols-7 gap-1 p-1 rounded-3xl m-1 relative"
        v-on-click-outside="() => (dropdown = false)"
      >
        <button
          @click="dropdown = true"
          class="text-xs col-span-6 flex justify-center pl-1 italic"
        >
          <p>{{ selectedUser }}</p>
        </button>
        <UserIcon class="h-4 w-4 text-green-500" />
        <div
          v-if="dropdown"
          class="absolute bg-white w-full space-y-2 z-50 border top-7 -left-2 overflow-y-scroll origin-top mx-2 max-h-60 rounded-3xl p-2"
        >
          <button
            v-for="user in allUsers"
            :class="`w-full items-center flex justify-between border border-lg hover:bg-gray-200 p-1 px-3 text-xs font-medium rounded-3xl ${
              selectedUser === user.username ? 'bg-gray-200' : 'bg-white'
            } `"
            @click="selectUser(user)"
            :disabled="selectedUser === user.username"
          >
            <p>{{ user.id }}. {{ user.username }}</p>
            <input type="checkbox" :checked="user.checked" />
          </button>
        </div>
      </div>
    </div>
    <Line
      :chartData="clockOutData"
      :chartOptions="chartOptions"
      class="w-full h-full"
      :height="200"
    />
  </div>
</template>
<script setup>
import { Line } from "vue-chartjs";
import { Chart, registerables } from "chart.js";
import moment from "moment";
import { onBeforeMount, ref } from "vue";
import { requestWorkingTimeOfUser } from "../../api/workingtimeApi";
import randomColor from "randomcolor";
import { UserIcon } from "@heroicons/vue/24/solid";
import { requestAllUsers } from "../../api/userApi";
import { vOnClickOutside } from "@vueuse/components";
import { store } from "../../store/store";
import { RadarSpinner } from "epic-spinners";
const loading = ref(true);
Chart.register(...registerables);

const dateTime = ref();
const labels = ref([]);
const clockOutData = ref({});
const dataset = ref([]);
const clockInData = ref({});
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: true,
});
const user = store.user;

const dropdown = ref(false);
const allUsers = ref([]);
const selectedUser = ref();

const getUserWorkingTime = async (id) => {
  let data = null;

  if (user.role === "employee")
    data = await requestWorkingTimeOfUser(user.userID);
  else data = await requestWorkingTimeOfUser(id);
  dateTime.value = data.data;
  dateTime.value.forEach((item) => {
    item.label = moment(item.end).format("DD/MM/YYYY");
    item.end = moment(item.end).format("HH");
    item.start = moment(item.start).format("HH");
  });
  labels.value = dateTime.value.map((item) => item.label);
  dataset.value = dateTime.value.map((item) => item.end);
  clockInData.value = dateTime.value.map((item) => item.start);
  clockOutData.value = {
    labels: labels.value,
    datasets: [
      {
        label: "Clock-In Time",
        data: clockInData.value,
        borderColor: randomColor({
          luminosity: "light",
          hue: "green",
        }),
        pointBackgroundColor: "#fff",
        pointBorderColor: "green",
      },
      {
        label: "Clock-Out Time",
        data: dataset.value,
        borderColor: randomColor({
          luminosity: "light",
          hue: "red",
        }),
        pointBackgroundColor: "#fff",
        pointBorderColor: "red",
      },
    ],
  };
  loading.value = false;
};

const getAllUsers = async () => {
  const data = await requestAllUsers();
  data.map((item) => (item.checked = false));
  allUsers.value = data;
  selectedUser.value = allUsers.value[0].username;
  allUsers.value[0].checked = true;
  await getUserWorkingTime(allUsers.value[0].id);
};

const selectUser = async (user) => {
  selectedUser.value = user.username;
  allUsers.value.forEach((item) => {
    if (item.id === user.id) item.checked = true;
    else item.checked = false;
  });
  await getUserWorkingTime(user.id);
  dropdown.value = false;
};

onBeforeMount(() => getAllUsers());
</script>
