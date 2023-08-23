<template>
  <div
    class="text-xs font-light justify-center sm:hidden lg:grid grid-cols-5 gap-8"
  >
    <div
      class="text-center ring-2 ring-blue-500 flex flex-col py-1 rounded-xl shadow-md font-medium border-4 border-white bg-blue-500 text-white"
    >
      <p class="font-light">Current time</p>
      <p>
        <span>{{ time.hours }}</span
        >:<span>{{ time.minutes }}</span
        >:<span>{{ time.seconds }}</span>
      </p>
    </div>
    <div
      class="text-center ring-2 ring-blue-500 flex flex-col py-1 rounded-xl shadow-md font-medium border-4 border-white bg-blue-500 text-white"
    >
      <p class="font-light">Today</p>
      <span>{{ new Date().toLocaleDateString() }}</span>
    </div>
    <div
      :class="`font-medium text-center ring-2 text-white  flex flex-col py-1 rounded-xl shadow-md border-4 border-white transition-all ease-in ${
        clockInTime ? 'bg-green-500 ring-green-500' : 'ring-red-700 bg-red-700'
      }`"
    >
      <p class="font-light">Clocked in</p>
      <p>{{ clockInTime ? clockInTime : "Not yet" }}</p>
    </div>
    <div
      :class="`transition-all ease-in text-center ring-2 text-white  flex flex-col py-1 font-medium rounded-xl shadow-md ${
        clockOutTime ? 'bg-green-500 ring-green-500' : 'bg-red-700 ring-red-700'
      } border-4 border-white`"
    >
      <p class="font-light">Clocked out</p>
      <p>{{ clockOutTime ? clockOutTime : "Not yet" }}</p>
    </div>
    <div
      :class="`transition-all ease-in text-center ring-2 text-white  flex flex-col py-1 rounded-xl shadow-md border-4 border-white font-medium ${
        clockInTime
          ? 'bg-orange-500 ring-orange-500'
          : 'bg-red-700 ring-red-700'
      }`"
    >
      <p class="font-light">Work time</p>
      <p>
        <span>{{ stopwatch.hours }}</span
        >:<span>{{ stopwatch.minutes }}</span
        >:<span>{{ stopwatch.seconds }}</span>
      </p>
    </div>
  </div>
</template>
<script setup>
import { useTime } from "vue-timer-hook";
const props = defineProps({
  clockInTime: {},
  clockOutTime: {},
  clocked: {},
  stopwatch: {},
});
const time = useTime();
</script>
