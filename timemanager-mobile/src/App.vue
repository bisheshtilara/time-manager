<template>
  <Sidebar v-if="$route.path !== '/signin' && $route.path !== '/signup'" />
  <div class="py-5">
    <router-view />
  </div>
</template>
<script setup>
import Sidebar from "./layouts/Sidebar.vue";
</script>
