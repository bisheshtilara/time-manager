<template>
  <div
    v-if="loading"
    class="w-full h-full border rounded-lg shadow-md flex items-center justify-center"
  >
    <radar-spinner :animation-duration="2000" :size="50" color="#b91c1c" />
  </div>
  <Radar
    v-else
    :chartData="chartData"
    :chartOptions="chartOptions"
    class="rounded-lg shadow-md border flex items-center"
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
Chart.register(...registerables);

const labels = ref([]);
const chartData = ref({});
const dataset = ref([]);
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: true,
});
const loading = ref(true);

const getAverageWorkingTimeOfAllUsers = async () => {
  const data = await getAllWorkingTimes();
  data.forEach((item) => {
    item.username = item.user.username;
    item.start = moment(item.start).format("HH");
    item.end = moment(item.end).format("HH");
    item.workingTime = item.end - item.start;
  });
  const unique = [...new Set(data.map((item) => item.username))];
  const averageWorkingTime = unique.map((item) => {
    const workingTime = data.filter((item2) => item2.username === item);
    const average = workingTime.reduce(
      (prev, current) => prev + current.workingTime,
      0
    );
    const averageWorkingTime = (average / workingTime.length).toFixed(0);
    return {
      username: item,
      averageWorkingTime: Number(averageWorkingTime),
    };
  });
  labels.value = averageWorkingTime.map((item) => item.username);
  dataset.value = averageWorkingTime.map((item) => item.averageWorkingTime);
  chartData.value = {
    labels: labels.value,
    datasets: [
      {
        label: "Average Working Time Of Every User",
        data: dataset.value,
        backgroundColor: randomColor({
          format: "rgba",
          alpha: 0.3,
          luminosity: "light",
          hue: "blue",
        }),
        borderColor: randomColor({
          format: "rgba",
          alpha: 1,
          luminosity: "light",
          hue: "blue",
        }),
        pointBackgroundColor: "#fff",
        pointBorderColor: "blue",
      },
    ],
  };
  loading.value = false;
};

onBeforeMount(() => getAverageWorkingTimeOfAllUsers());
</script>
