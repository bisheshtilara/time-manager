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

const getLowestWorkingTimeOfAllUsers = async () => {
  const data = await getAllWorkingTimes();
  data.forEach((item) => {
    item.username = item.user.username;
    item.start = moment(item.start).format("HH");
    item.end = moment(item.end).format("HH");
    item.workingTime = item.end - item.start;
  });
  const unique = [...new Set(data.map((item) => item.username))];
  const lowestWorkingTime = unique.map((item) => {
    const workingTime = data.filter((item2) => item2.username === item);
    const lowest = workingTime.reduce((prev, current) =>
      prev.workingTime < current.workingTime ? prev : current
    );
    return lowest;
  });
  labels.value = lowestWorkingTime.map((item) => item.username);
  dataset.value = lowestWorkingTime.map((item) => item.workingTime);
  const bgColor = labels.value.map((item) => randomColor());
  chartData.value = {
    labels: labels.value,
    datasets: [
      {
        label: "Lowest Working Time Of Every User",
        data: dataset.value,
        backgroundColor: randomColor({
          format: "rgba",
          alpha: 0.3,
          luminosity: "light",
          hue: "red",
        }),
        borderColor: randomColor({
          format: "rgba",
          alpha: 1,
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

onBeforeMount(() => getLowestWorkingTimeOfAllUsers());
</script>
