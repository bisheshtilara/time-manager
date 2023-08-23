<template>
  <template v-if="!store.user">
    <router-view />
  </template>
  <template v-if="store.user">
    <div class="overflow-hidden">
      <div class="h-20">
        <Navbar />
      </div>
      <div class="flex overflow-hidden">
        <Sidebar />
        <main class="flex-grow p-6 font-poppins">
          <router-view />
        </main>
      </div>
    </div>
  </template>
</template>

<script setup>
import Navbar from "./layout/Navbar.vue";
import Sidebar from "./layout/Sidebar.vue";
import { store } from "./store/store";
</script>
