<template>
  <button
    v-if="!tableLoading"
    class="bg-green-500 rounded-lg ring-2 ring-green-500 border-2 border-white fixed z-50 text-white px-2 right-8 transition-all ease-in hover:-translate-x-2 flex items-center gap-2 py-1"
    @click="triggerAddTeam()"
  >
    <UserGroupIcon class="h-6 w-6" />
    <p>Add team</p>
  </button>

  <div class="grid grid-cols-1 gap-6 m-2">
    <div v-if="!tableLoading && teams.length === 0">
      You don't have any teams.
    </div>
    <div v-else v-for="team in teams" :key="team.id" class="rounded-md">
      <div v-if="!tableLoading" class="flex gap-3 items-center">
        <p class="text-lg mb-2">{{ team.name }}</p>
        <p
          v-if="user.role === 'admin' || user.role === 'general-manager'"
          class="text-lg mb-2"
        >
          -
        </p>
        <p
          v-if="user.role === 'admin' || user.role === 'general-manager'"
          class="text-xs mb-2"
        >
          Created by: {{ team.creatorInfo.username }},
          {{ team.creatorInfo.role }}
        </p>
      </div>
      <TeamTable
        :team="team.users"
        :name="team.name"
        :teamID="team.id"
        :teamName="team.name"
        :teamCreator="team.creator"
        @deleteTeam="deleteTeam"
        :tableLoading="tableLoading"
        @stopTableLoading="stopTableLoading"
      />
    </div>
  </div>
  <ConfirmModal
    :actionType="actionType"
    :modalVisible="modalVisible"
    @closeModal="() => (modalVisible = false)"
    @addTeam="addTeam"
  />
</template>
<script setup>
import { UserGroupIcon } from "@heroicons/vue/24/solid";
import { onBeforeMount, ref } from "vue";
import {
  requestAllTeams,
  requestDeleteTeam,
  requestAddTeam,
} from "../api/teamsApi";
import ConfirmModal from "../common/Teams/ConfirmModal.vue";
import TeamTable from "../common/Teams/TeamTable.vue";
import { useToast } from "vue-toastification";
import { requestUserById } from "../api/userApi";
import { store } from "../store/store";

const toast = useToast();
const teams = ref();
const modalVisible = ref(false);
const actionType = ref("add");
const user = store.user;

const tableLoading = ref(true);
const stopTableLoading = () => (tableLoading.value = false);

const getAllTeams = async () => {
  const data = await requestAllTeams();
  if (data.length === 0) {
    teams.value = [];
    tableLoading.value = false;
    return;
  }
  teams.value = data;
  teams.value.sort(function (prev, current) {
    return prev.id - current.id;
  });
  if (user.role !== "admin" && user.role !== "general-manager") {
    teams.value = teams.value.filter((team) => team.creator === user.userID);
    if (teams.value.length === 0) {
      teams.value = [];
      tableLoading.value = false;
      return;
    }
  } else {
    for (const team of teams.value) {
      team.creatorInfo = await requestUserById(team.creator);
    }
  }
};
onBeforeMount(() => getAllTeams());

const deleteTeam = async (teamID) => {
  await requestDeleteTeam(teamID);
  teams.value = teams.value.filter((team) => team.id !== teamID);
  toast.success("Team deleted successfully");
};
const triggerAddTeam = () => {
  modalVisible.value = true;
};

const addTeam = async (teamName) => {
  teams.value.unshift({
    name: teamName,
    users: [],
    id: teams.value[teams.value.length - 1].id + 1,
    creator: user.userID,
    creatorInfo: {
      id: user.userID,
      email: user.email,
      username: user.username,
      role: user.role,
    },
  });
  const data = {
    name: teamName,
    users: [],
    creator: user.userID,
  };
  await requestAddTeam(data);
  modalVisible.value = false;
  toast.success("Team added successfully");
};
</script>
