<script setup>
import {
  getAllWorkingTimes as fetchAllWorkingtimes,
  deleteWorkingTime,
} from "../api/workingtimeApi";
import { onBeforeMount, ref, watchEffect } from "vue";
import { TrashIcon, PencilSquareIcon } from "@heroicons/vue/24/solid";
const workingtimes = ref([]);

const getAllWorkingTimes = async () => {
  const data = await fetchAllWorkingtimes();
  workingtimes.value = data;
};
const deleteSelectedWorkingtime = async (id) => {
  const request = await deleteWorkingTime(id);
  workingtimes.value = workingtimes.value.filter(
    (workingtime) => workingtime.id !== id
  );
};
watchEffect(() => getAllWorkingTimes());
const headers = [
  { text: "ID", value: "id", sortable: true },
  { text: "END", value: "end" },
  { text: "START", value: "start" },
  { text: "EMAIL", value: "user.email" },
  { text: "USERNAME", value: "user.username" },
  { text: "USERID", value: "user.id", sortable: true },
  { text: "ACTIONS", value: "actions" },
];
</script>

<template>
  <div class="space-y-5">
    <p class="font-medium leading-6 text-gray-900 text-lg">Workingtimes</p>
    <EasyDataTable
      :headers="headers"
      :items="workingtimes"
      alternating
      border-cell
      :rows-per-page="15"
      :sort-by="'user.id'"
    >
      <template #item-actions="item">
        <div class="flex gap-2">
          <router-link
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-blue-500 text-white ring-2 ring-blue-500 border border-white rounded-md m-2 flex items-start gap-1"
            :to="'/workingtime/' + item.user.id + '/' + item.id"
          >
            <PencilSquareIcon class="text-white h-4 w-4" />
            <p>Edit</p>
          </router-link>
          <button
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-red-600 text-white rounded-md ring-2 ring-red-600 border border-white m-2 flex items-start gap-1"
            @click="deleteSelectedWorkingtime(item.id)"
          >
            <TrashIcon class="text-white h-4 w-4" />
            <p>Delete</p>
          </button>
        </div>
      </template>
    </EasyDataTable>
  </div>
</template>
