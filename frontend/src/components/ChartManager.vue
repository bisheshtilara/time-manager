<template>
  <div class="grid grid-cols-3 gap-4">
    <HighestWorkingTimeChart v-if="user.role !== 'employee'" />
    <AverageWorkingRadarChart v-if="user.role !== 'employee'" />
    <LowestWorkingTimeChart v-if="user.role !== 'employee'" />
    <WorktimeChart />
    <PolarChart />
    <ClockChart />
    <AveragePolarChart />
  </div>
</template>
<script setup>
import HighestWorkingTimeChart from "../common/Charts/HighestWorkingTimeChart.vue";
import WorktimeChart from "../common/Charts/WorktimeChart.vue";
import PolarChart from "../common/Charts/PolarChart.vue";
import AveragePolarChart from "../common/Charts/AveragePolarChart.vue";
import ClockChart from "../common/Charts/ClockChart.vue";
import AverageWorkingRadarChart from "../common/Charts/AverageWorkingRadarChart.vue";
import LowestWorkingTimeChart from "../common/Charts/LowestWorkingTimeChart.vue";
import { store } from "../store/store";

const user = store.user;
</script>
