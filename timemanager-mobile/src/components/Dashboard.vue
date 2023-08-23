<template>
  <div class="py-5 pr-5 overflow-y-scroll space-y-4">
    <p class="text-3xl font-medium pl-5 pb-6">Dashboard</p>
    <div>
      <div
        class="flex flex-wrap items-center gap-4 px-6 text-gray-500 text-sm pb-3"
      >
        <button
          :class="`border-2 rounded-xl py-1 px-2 ${
            selectedChart === 'bar'
              ? 'bg-red-800 text-white italic ring-2 ring-red-800 border-white'
              : ''
          } transition-all ease-in`"
          @click="selectedChart = 'bar'"
        >
          Work times
        </button>
        <button
          :class="`border-2 rounded-xl py-1 px-2 ${
            selectedChart === 'line'
              ? 'bg-red-800 text-white italic ring-2 ring-red-800 border-white'
              : ''
          } transition-all ease-in`"
          @click="selectedChart = 'line'"
        >
          Clock times
        </button>
      </div>
      <Bar
        v-if="selectedChart === 'bar'"
        :chartData="workingTimeChartData"
        :chartOptions="chartOptions"
      />
      <Line
        v-if="selectedChart === 'line'"
        :chartData="chartData"
        :chartOptions="chartOptions"
      />
    </div>
  </div>
</template>
<script setup>
import { Line, Bar } from "vue-chartjs";
import { Chart, registerables } from "chart.js";
import { requestUserWorkingTimes } from "../api/workingtimeApi";
import { onBeforeMount, ref } from "vue";
import moment from "moment";
import randomColor from "randomcolor";

Chart.register(...registerables);

const user = JSON.parse(localStorage.getItem("user"));
const selectedChart = ref("bar");
const chartData = ref({});
const workingTimeChartData = ref({});
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
};

const getUserClockTimes = async () => {
  const workingTimes = await requestUserWorkingTimes(user.userID);
  let clockInData = [];
  let clockOutData = [];
  let workingTimeData = [];
  let labels = [];
  for (const workingTime of workingTimes) {
    clockInData.push(moment(workingTime.start).format("HH"));
    clockOutData.push(moment(workingTime.end).format("HH"));
    workingTimeData.push(
      moment(workingTime.end).diff(moment(workingTime.start), "hours")
    );
    labels.push(moment(workingTime.end).format("DD/MM/YYYY"));
  }
  chartData.value = {
    labels: labels,
    datasets: [
      {
        label: "Clock-In Time",
        data: clockInData,
        borderColor: randomColor({
          luminosity: "light",
          hue: "green",
        }),
        pointBackgroundColor: "#fff",
        pointBorderColor: "green",
      },
      {
        label: "Clock-Out Time",
        data: clockOutData,
        borderColor: randomColor({
          luminosity: "light",
          hue: "red",
        }),
        pointBackgroundColor: "#fff",
        pointBorderColor: "red",
      },
    ],
  };
  workingTimeChartData.value = {
    labels: labels,
    datasets: [
      {
        label: "Working Time",
        data: workingTimeData,
        backgroundColor: randomColor({
          luminosity: "light",
          hue: "random",
        }),
      },
    ],
  };
};
onBeforeMount(() => getUserClockTimes());
</script>
