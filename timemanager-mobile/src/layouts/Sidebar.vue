<template>
  <div
    :class="`bg-red-800 fixed h-screen w-[88%] transition-all duration-500 shadow-2xl ease-in-out z-50 ${
      sidebarVisible ? 'translate-x-0' : '-translate-x-full'
    }`"
  >
    <div class="flex justify-center items-center h-[15%] bg-white shadow-md">
      <img :src="gothamLogo" alt="Gotham" class="h-20" />
    </div>
    <div class="h-[70%] bg-red-800 shadow-md space-y-3 pt-10 px-6">
      <router-link
        v-for="route in visibleRoutes"
        v-bind:key="route.name"
        :to="route.path"
        :class="`flex items-center py-3 px-8 gap-4 text-lg text-white font-regular ${
          $route.name === route.name ? 'bg-red-700 rounded-xl' : ''
        } transition-all ease-in`"
        @click="sidebarVisible = false"
      >
        <component
          class="h-7 w-7"
          v-bind:is="$route.name === route.name ? route.solidIcon : route.icon"
        />
        <p>{{ route.name }}</p>
      </router-link>
    </div>
    <div
      class="h-[15%] bg-red-800 border-t border-white flex items-center justify-center px-6"
    >
      <div
        class="flex items-center w-full px-8 py-3 gap-4 text-white"
        @click="requestLogout"
      >
        <ArrowLeftOnRectangleIcon class="h-7 w-7" />
        <p class="font-regular text-lg col-span-10 text-center">Logout</p>
      </div>
    </div>
  </div>
  <div @click="sidebarVisible = !sidebarVisible" class="fixed right-2 top-2">
    <Bars3Icon class="h-8 w-8 text-black" />
  </div>
</template>
<script setup>
import { ref } from "vue";
import { Bars3Icon } from "@heroicons/vue/24/outline";
import { ArrowLeftOnRectangleIcon } from "@heroicons/vue/24/solid";
import gothamLogo from "../assets/gotham.png";
import { routes } from "@/routes";
import { requestLogout } from "@/api/authApi";

const sidebarVisible = ref(false);
const visibleRoutes = routes.filter((route) => route.displayInNav !== false);
</script>
