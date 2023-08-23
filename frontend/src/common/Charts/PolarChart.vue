<template>
  <div
    v-if="loading"
    class="w-full h-full border rounded-lg shadow-md flex items-center justify-center"
  >
    <radar-spinner :animation-duration="2000" :size="50" color="#b91c1c" />
  </div>
  <div v-else class="border rounded-lg shadow-md">
    <div
      v-if="allTeams.length === 0"
      class="flex items-center justify-center w-full h-full italic"
    >
      No Teams
    </div>
    <div v-else class="flex justify-between px-2 w-full items-center">
      <p class="text-xs font-medium">Highest Working Times</p>
      <div class="border grid grid-cols-7 gap-1 p-1 rounded-3xl m-1 relative">
        <button
          class="text-xs col-span-6 flex justify-center italic font-medium"
          @click="dropdown = true"
        >
          <p>{{ selectedTeam.name }}</p>
        </button>
        <UserGroupIcon class="h-4 w-4 text-green-500" />
        <div
          v-if="dropdown"
          class="absolute w-full bg-white z-50 border rounded-lg p-1 top-7 space-y-2 overflow-y-scroll max-h-60"
        >
          <div
            v-for="team in allTeams"
            :class="`cursor-pointer flex justify-between border px-2 py-1 rounded-3xl text-xs italic ${
              selectedTeam === team ? 'bg-gray-200' : 'bg-white'
            }`"
            @click="selectTeam(team)"
          >
            <p>{{ team.name }}</p>
            <input type="checkbox" :checked="team.checked" />
          </div>
        </div>
      </div>
    </div>
    <PolarArea :chartData="chartData" :chartOptions="chartOptions" />
  </div>
</template>

<script setup>
import { onBeforeMount, ref } from "vue";
import { PolarArea } from "vue-chartjs";
import { requestWorkingTimeOfUser } from "../../api/workingtimeApi";
import { requestAllTeams, requestTeamById } from "../../api/teamsApi";
import { Chart, registerables } from "chart.js";
import moment from "moment";
import randomColor from "randomcolor";
import { requestUserById } from "../../api/userApi";
import { UserGroupIcon } from "@heroicons/vue/24/solid";
import { store } from "../../store/store";
import { RadarSpinner } from "epic-spinners";
Chart.register(...registerables);

const labels = ref([]);
const chartData = ref({});
const dataset = ref([]);
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: true,
});
const user = store.user;
const dropdown = ref(false);
const selectedTeam = ref([]);
const allTeams = ref([]);
const loading = ref(true);

const getAllTeams = async () => {
  const data = await requestAllTeams();
  if (data.length === 0) {
    allTeams.value = [];
    loading.value = false;
    return;
  }
  data.map((team) => {
    team.checked = false;
  });
  allTeams.value = data;
  if (user.role === "employee")
    allTeams.value = allTeams.value.filter((team) =>
      team.users.includes(user.userID)
    );
  if (user.role === "manager")
    allTeams.value = allTeams.value.filter(
      (team) => team.creator === user.userID
    );
  if (allTeams.value.length === 0) {
    loading.value = false;
    return;
  }
  allTeams.value[0].checked = true;
  selectedTeam.value = allTeams.value[0];
  await getTeamWorkingTime(allTeams.value[0].id);
};

const selectTeam = async (team) => {
  loading.value = true;
  dropdown.value = false;
  selectedTeam.value = team;
  allTeams.value.map((team) => {
    if (selectedTeam.value.id === team.id) team.checked = true;
    else team.checked = false;
  });
  await getTeamWorkingTime(team.id);
};

const getTeamWorkingTime = async (id) => {
  labels.value = [];
  dataset.value = [];
  const data = await requestTeamById(id);
  for (const user of data.users) {
    const userInfo = await requestUserById(user);
    const workingTimesResponse = await requestWorkingTimeOfUser(user);
    if (workingTimesResponse.data.length === 0) {
      labels.value.push(userInfo.username);
      dataset.value.push(0);
    } else {
      for (const workingTime of workingTimesResponse.data) {
        workingTime.start = moment(workingTime.start).format("HH");
        workingTime.end = moment(workingTime.end).format("HH");
        workingTime.workingTime = workingTime.end - workingTime.start;
      }
      const highestWorkingTime = workingTimesResponse.data.reduce(
        (prev, current) =>
          prev.workingTime > current.workingTime ? prev : current
      );
      labels.value.push(userInfo.username);
      dataset.value.push(highestWorkingTime.workingTime);
    }
  }
  const bgColor = labels.value.map((item) =>
    randomColor({
      format: "rgba",
      alpha: 0.3,
    })
  );
  chartData.value = {
    labels: labels.value,
    datasets: [
      {
        data: dataset.value,
        backgroundColor: bgColor,
      },
    ],
  };
  loading.value = false;
};
onBeforeMount(() => getAllTeams());
</script>
