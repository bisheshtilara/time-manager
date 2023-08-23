<template>
  <div>
    <div
      class="hidden md:flex md:w-64 md:flex-col md:fixed mt-20 md:inset-y-0 font-poppins"
    >
      <div
        class="flex-1 flex flex-col min-h-0 bg-white border border-t-0 shadow-md"
      >
        <div class="flex-1 flex flex-col pt-0 pb-4 overflow-y-auto mt-6">
          <div
            class="cursor-pointer flex-shrink-0 flex border-2 mt-1 text-white bg-blue-500 ring-2 ring-blue-500 mx-4 mb-8 rounded-md shadow-lg p-2 font-semibold transition-all ease-in hover:-translate-x-2"
            @click="toggleModal()"
          >
            <div class="flex items-center">
              <img
                class="inline-block h-9 w-9 rounded-full"
                src="http://www.gravatar.com/avatar/?d=mp"
                alt=""
              />
              <div class="ml-3">
                <p class="text-sm font-medium">{{ username }}</p>
                <p class="text-xs font-medium">{{ store.user.role }}</p>
              </div>
            </div>
          </div>
          <nav class="flex-1 space-y-1">
            <ul class="space-y-4">
              <li
                v-for="route in navRoutes"
                :key="route.name"
                class="flex gap-4 group"
              >
                <div
                  :class="`${
                    $route.name === route.name
                      ? 'scale-100'
                      : 'group-hover:scale-[.60] group scale-0'
                  } border-r-4 border-red-800 rounded-r-xl transition-all ease-in mb-1`"
                />
                <router-link
                  :key="route.name"
                  :to="route.path"
                  :class="[
                    $route.name === route.name
                      ? 'bg-red-800 text-white ring-2 ring-red-800 border-white border-2'
                      : 'transition-all ease-in group-hover:translate-x-2 border',
                    'group w-full shadow-md flex items-center font-light italic px-2 py-3 mb-1 text-sm rounded-md mr-4',
                  ]"
                >
                  <component
                    class="w-6 h-6 mx-3"
                    :is="
                      $route.name === route.name ? route.solidIcon : route.icon
                    "
                  />
                  {{ route.name }}
                </router-link>
              </li>
            </ul>
          </nav>
        </div>
        <button
          class="flex-shrink-0 flex border-2 border-white mx-4 ml-6 mb-8 rounded-lg shadow-lg p-2 font-medium bg-red-800 ring-2 ring-red-800 text-white transition-all ease-in hover:-translate-x-2"
          @click="store.logout()"
        >
          <div class="flex items-center gap-3">
            <ArrowLeftOnRectangleIcon class="h-6 w-6" />
            <p class="text-sm">Logout</p>
          </div>
        </button>
      </div>
    </div>
    <div class="md:pl-64 flex flex-col flex-1">
      <div
        class="sticky top-0 z-10 md:hidden pl-1 pt-1 sm:pl-3 sm:pt-3 bg-gray-100"
      >
        <button
          type="button"
          class="-ml-0.5 -mt-0.5 h-12 w-12 inline-flex items-center justify-center rounded-md text-gray-500 hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
          @click="sidebarOpen = true"
        >
          <span class="sr-only">Open sidebar</span>
        </button>
      </div>
    </div>
  </div>
  <ProfileModal :modalVisible="modalVisible" @toggleModal="toggleModal" />
</template>

<script setup>
import { ref } from "vue";
import {
  Dialog,
  DialogOverlay,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import routes from "../constants/routes";
import { store } from "../store/store";
import { ArrowLeftOnRectangleIcon } from "@heroicons/vue/24/outline";
import ProfileModal from "../common/ProfileModal.vue";

const navRoutes = routes.filter((r) => r.displayInNav != false);
const sidebarOpen = ref(false);
const username = ref(store.user.username);
const modalVisible = ref(false);
const toggleModal = () => (modalVisible.value = !modalVisible.value);
</script>
