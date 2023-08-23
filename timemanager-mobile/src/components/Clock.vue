<template>
  <div class="px-5">
    <p class="font-medium text-3xl pt-12">Clock Manager</p>
    <div
      class="pt-10 pb-48 font-regular text-gray-500 flex flex-col justify-between h-screen"
    >
      <div class="grid gap-4">
        <div
          :class="`p-8 rounded-xl text-white text-center border-2 border-white ${
            clockStatus
              ? 'bg-green-500 ring-green-500'
              : 'bg-purple-500 ring-purple-500'
          } ring-2 transition-all ease-in font-black italic shadow-md`"
        >
          <p>Clock in Time</p>
          <p>{{ clockInTime ? clockInTime : "Not yet" }}</p>
        </div>
        <div
          :class="`p-8 rounded-xl text-white text-center border-2 border-white bg-red-600 ring-red-600 ring-2 transition-all ease-in font-black italic shadow-md`"
        >
          <p>Clock out Time</p>
          <p>{{ clockOutTime ? clockOutTime : "Not yet" }}</p>
        </div>
        <div
          class="p-8 col-span-2 rounded-xl bg-orange-500 text-white font-black italic text-center transition-all ease-in ring-2 border-2 border-white ring-orange-500 shadow-md"
        >
          <p>Total Working Time</p>
          <p>
            <span>{{ stopwatch.hours }}</span
            >:<span>{{ stopwatch.minutes }}</span
            >:<span>{{ stopwatch.seconds }}</span>
          </p>
        </div>
      </div>
      <button
        :class="`rounded-xl w-full p-5 border-2 ring-2 border-white text-white font-bold  ${
          clockStatus
            ? 'bg-green-500 ring-green-500'
            : 'bg-purple-500 ring-purple-500'
        } flex items-center justify-center gap-1`"
        @click="clockUser()"
      >
        <ClockIcon class="h-6 w-6 text-white" />
        <p>{{ clockStatus ? "Clock out" : "Clock in" }}</p>
      </button>
    </div>
  </div>
</template>
<script setup>
import { onBeforeMount, ref } from "vue";
import { ClockIcon } from "@heroicons/vue/24/solid";
import { requestClockUser } from "@/api/clockApi";
import moment from "moment";
import { useStopwatch } from "vue-timer-hook";

const user = JSON.parse(localStorage.getItem("user"));
const clock = JSON.parse(localStorage.getItem("clock"));
const clockIn = JSON.parse(localStorage.getItem("clockIn"));
const clockOut = JSON.parse(localStorage.getItem("clockOut"));
const clockStatus = ref(clock ? clock.status : null);
const clockInTime = ref(
  clockIn ? moment(clockIn.time).format("HH:MM:ss") : null
);
const clockOutTime = ref(
  clockOut ? moment(clockOut.time).format("HH:MM:ss") : null
);
const stopwatch = useStopwatch(0, false);

const clockUser = async () => {
  const response = await requestClockUser(user.userID);
  clockStatus.value = response.status;
  if (response.status) {
    clockInTime.value = moment(response.time).format("HH:MM:ss");
    localStorage.setItem("clock", JSON.stringify(response));
    localStorage.setItem("clockIn", JSON.stringify(response));
    localStorage.removeItem("clockOut");
    clockOutTime.value = null;
    stopwatch.reset();
  } else if (!response.status) {
    clockOutTime.value = moment(response.time).format("HH:MM:ss");
    localStorage.setItem("clock", JSON.stringify(response));
    localStorage.setItem("clockOut", JSON.stringify(response));
    stopwatch.pause();
  }
};
onBeforeMount(() => {
  if (!clock) return;
  if (!clock.status) return;
  const timeOffset = moment().diff(moment(clock.time), "seconds");
  stopwatch.reset(timeOffset);
});
</script>
