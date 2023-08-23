<template>
  <Disclosure
    as="nav"
    class="bg-white border shadow-md fixed top-0 z-50 w-full"
    v-slot="{ open }"
  >
    <div class="mx-4 max-w-full px-2 sm:px-6 lg:px-8">
      <div class="relative flex h-20 items-center justify-between">
        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
          <!-- Mobile menu button-->
          <DisclosureButton
            class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
          >
            <span class="sr-only">Open main menu</span>
            <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
            <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
          </DisclosureButton>
        </div>
        <div
          class="flex flex-1 md:items-center sm:items-stretch sm:justify-start"
        >
          <div class="flex flex-shrink-0 items-center">
            <img
              class="block h-8 w-auto lg:hidden"
              :src="gothamLogo"
              alt="Gotham"
            />
            <img
              class="hidden h-16 w-auto lg:block"
              :src="gothamLogo"
              alt="Gotham"
            />
          </div>
          <!-- <div class="hidden sm:ml-6 sm:block">
            <div class="flex space-x-4">
              <a
                v-for="item in navigation"
                :key="item.name"
                :href="item.href"
                :class="[
                  item.current
                    ? 'bg-gray-900 text-white'
                    : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                  'px-3 py-2 rounded-md text-sm font-medium',
                ]"
                :aria-current="item.current ? 'page' : undefined"
                >{{ item.name }}</a
              >
            </div>
          </div> -->
          <div class="hidden sm:ml-6 md:mx-40 sm:block w-full">
            <Clock
              :clockInTime="clockInTime"
              :clockOutTime="clockOutTime"
              :clocked="clocked"
              :stopwatch="stopwatch"
            />
          </div>
        </div>
        <div
          class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0"
        >
          <!-- <button
            type="button"
            :class="`ring-2 text-xs rounded-lg flex items-center gap-2 text-white ${
              clocked
                ? 'bg-green-500 ring-green-500'
                : 'bg-red-700 ring-red-700'
            } font-light hover:-translate-y-1 transition-all ease-in border py-2 md:w-32 justify-center shadow-md`"
            @click="clockController"
          >
            <ClockIconSolid v-if="clocked" class="h-6 w-6" aria-hidden="true" />
            <ClockIcon v-else class="h-6 w-6" aria-hidden="true" />
            <p>{{ clocked ? "Clock out" : "Clock in" }}</p>
          </button> -->
          <button
            type="button"
            :class="`ring-2 text-xs rounded-full flex items-center border-2 border-white text-white ${
              clocked
                ? 'bg-green-500 ring-green-500'
                : 'bg-purple-500 ring-purple-500'
            } hover:-translate-y-1 transition-all ease-in justify-center shadow-md`"
            @click="clockController"
          >
            <ClockIcon class="h-9 w-9" aria-hidden="true" />
          </button>
        </div>
      </div>
    </div>

    <DisclosurePanel class="sm:hidden">
      <div class="space-y-1 px-2 pt-2 pb-3">
        <DisclosureButton
          v-for="item in navigation"
          :key="item.name"
          as="a"
          :href="item.href"
          :class="[
            item.current
              ? 'bg-gray-900 text-white'
              : 'text-gray-300 hover:bg-gray-700 hover:text-white',
            'block px-3 py-2 rounded-md text-base font-medium',
          ]"
          :aria-current="item.current ? 'page' : undefined"
          >{{ item.name }}</DisclosureButton
        >
      </div>
    </DisclosurePanel>
  </Disclosure>
</template>

<script setup>
import {
  Disclosure,
  DisclosureButton,
  DisclosurePanel,
  // Menu,
  // MenuButton,
  // MenuItem,
  // MenuItems,
} from "@headlessui/vue";
import { Bars3Icon, XMarkIcon, ClockIcon } from "@heroicons/vue/24/outline";
import { onBeforeMount, ref } from "vue";
import gothamLogo from "../assets/gotham.png";
import Clock from "../common/Clock.vue";
import { useStopwatch, useTimer } from "vue-timer-hook";
import { getClockByUserId, requestClockUser } from "../api/clockApi";
import { store } from "../store/store";
import moment from "moment";

const user = store.user;
// const navigation = [
//   { name: "Dashboard", href: "#", current: true },
//   { name: "Team", href: "#", current: false },
//   { name: "Projects", href: "#", current: false },
//   { name: "Calendar", href: "#", current: false },
// ];
const clockInTime = ref();
const clockOutTime = ref();
const clocked = ref(false);
const stopwatch = useStopwatch(0, false);

const clockController = async () => {
  const response = await requestClockUser(user.userID);
  if (response.data.status) {
    clocked.value = true;
    clockInTime.value = moment(response.data.time).format("HH:MM:ss");
    stopwatch.reset();
  } else if (!response.data.status) {
    clocked.value = false;
    clockOutTime.value = moment(response.data.time).format("HH:MM:ss");
    stopwatch.pause();
  }
};
const getUserClock = async () => {
  const response = await getClockByUserId(user.userID);
  if (!response) clocked.value = false;
  else if (response) {
    clocked.value = response.status;
    if (response.status) {
      clockInTime.value = moment(response.time).format("HH:MM:ss");
      const timeOffset = moment().diff(moment(response.time), "seconds");
      stopwatch.reset(timeOffset);
    }
  }
};
onBeforeMount(() => getUserClock());
</script>
