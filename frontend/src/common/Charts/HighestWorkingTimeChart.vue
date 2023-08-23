<template>
  <div
    v-if="loading"
    class="w-full h-96 border rounded-lg shadow-md flex items-center justify-center"
  >
    <radar-spinner :animation-duration="2000" :size="50" color="#b91c1c" />
  </div>
  <Radar
    v-else
    :chartData="chartData"
    :chartOptions="chartOptions"
    class="rounded-lg shadow-md flex items-center border"
  />
</template>

<script setup>
import { onBeforeMount, ref } from "vue";
import { getAllWorkingTimes } from "../../api/workingtimeApi";
import { Radar } from "vue-chartjs";
import { Chart, registerables } from "chart.js";
import moment from "moment";
import randomColor from "randomcolor";
import { RadarSpinner } from "epic-spinners";
const loading = ref(true);
Chart.register(...registerables);

const labels = ref([]);
const chartData = ref({});
const dataset = ref([]);
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: true,
});
const getHighestWorkingTimeOfAllUsers = async () => {
  try {
    const data = await getAllWorkingTimes();
    data.forEach((item) => {
      item.username = item.user.username;
      item.start = moment(item.start).format("HH");
      item.end = moment(item.end).format("HH");
      item.workingTime = item.end - item.start;
    });
    const unique = [...new Set(data.map((item) => item.username))];
    const highestWorkingTime = unique.map((item) => {
      const workingTime = data.filter((item2) => item2.username === item);
      const highest = workingTime.reduce((prev, current) =>
        prev.workingTime > current.workingTime ? prev : current
      );
      return highest;
    });
    labels.value = highestWorkingTime.map((item) => item.username);
    dataset.value = highestWorkingTime.map((item) => item.workingTime);
    chartData.value = {
      labels: labels.value,
      datasets: [
        {
          label: "Highest Working Time Of Every User",
          data: dataset.value,
          backgroundColor: randomColor({
            format: "rgba",
            alpha: 0.3,
            luminosity: "light",
            hue: "green",
          }),
          borderColor: randomColor({
            format: "rgba",
            alpha: 1,
            luminosity: "light",
            hue: "green",
          }),
          pointBackgroundColor: "#fff",
          pointBorderColor: "green",
        },
      ],
    };
    loading.value = false;
  } catch (error) {
    return;
  }
};

onBeforeMount(() => getHighestWorkingTimeOfAllUsers());
</script>
