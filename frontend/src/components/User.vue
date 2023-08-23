<script setup>
import {
  requestAllUsers,
  requestDeleteUser,
  requestUpdateUser,
  requestAddUser,
} from "../api/userApi";
import { onBeforeMount, ref } from "vue";
import {
  TrashIcon,
  PencilSquareIcon,
  UserPlusIcon,
  CalendarIcon,
  ArrowPathIcon,
  ClockIcon,
} from "@heroicons/vue/24/solid";
import { useToast } from "vue-toastification";
import AlertModal from "../common/AlertModal.vue";
import { store } from "../store/store";
import { requestClockStatusByUserId, requestClockUser } from "../api/clockApi";
import { RadarSpinner } from "epic-spinners";

const toast = useToast();
const users = ref([]);
const userID = ref();
const actionType = ref();
const modalVisible = ref(false);
const loggedInUser = store.user;
const loading = ref(true);
const dataLoading = ref(true);

const user = store.user;

const toggleModal = (id, type) => {
  if (id) userID.value = id;
  if (type) actionType.value = type;
  modalVisible.value = !modalVisible.value;
};

const getAllUsers = async () => {
  const data = await requestAllUsers();
  users.value = data;

  if (loggedInUser.role === "general-manager")
    users.value = users.value.filter(
      (user) => user.role !== "admin" && user.id !== loggedInUser.userID
    );
  dataLoading.value = false;
  for (const user of users.value) {
    const clockStatus = await requestClockStatusByUserId(user.id);
    if (clockStatus) user.clockStatus = true;
    else user.clockStatus = false;
  }
  loading.value = false;
};

onBeforeMount(() => getAllUsers());

const handleClockButtonClick = async (id) => {
  const response = await requestClockUser(id);
  const clockStatus = await requestClockStatusByUserId(id);
  const user = users.value.find((user) => user.id === id);
  user.clockStatus = clockStatus;
  if (clockStatus) toast.success("Clocked in Successfully");
  else toast.success("Clocked out Successfully");
};

const editUser = async (id, email, username, role, password) => {
  toggleModal();
  const data = {};
  if (email) data.email = email;
  if (username) data.username = username;
  if (role) data.role = role;
  if (password) data.password = password;

  await requestUpdateUser(id, data);
  toast.success("User updated successfully");
  users.value.map((user) => {
    if (user.id === id) {
      user.email = email;
      user.username = username;
    }
    return user;
  });
};

const addUser = async (email, username, role, password) => {
  toggleModal();
  const user = { email, username, role, password };
  const response = await requestAddUser(user);
  toast.success("User added successfully");
  users.value.push({
    email,
    username,
    id: users.value[users.value.length - 1].id + 1,
  });
};

const promoteUser = async (id) => {
  toggleModal();
  const response = await requestUpdateUser(id, { role: "manager" });
  toast.success("User promoted successfully");
  users.value.map((user) => {
    if (user.id === id) user.role = "manager";
    return user;
  });
};
const action = (id, actionType, username, email, role, password) => {
  if (actionType === "delete") return deleteUser(id);
  else if (actionType === "edit")
    return editUser(id, email, username, role, password);
  else if (actionType === "add")
    return addUser(email, username, role, password);
  else if (actionType === "promote") return promoteUser(id);
};

const deleteUser = async (id) => {
  const request = await requestDeleteUser(id);
  if (request) {
    toggleModal();
    toast.success("Deleted user successfully");
    const refreshedUsers = users.value.filter((user) => user.id !== id);
    users.value = refreshedUsers;
  } else toast.error("Failed to delete user.");
};

const headers = [
  { text: "ID", value: "id", sortable: true },
  { text: "USERNAME", value: "username" },
  { text: "EMAIL", value: "email" },
  { text: "ROLE", value: "role" },
  { text: "ACTIONS", value: "actions" },
];
</script>

<template>
  <radar-spinner
    v-if="dataLoading"
    :animation-duration="2000"
    :size="100"
    color="#b91c1c"
    class="m-auto"
  />
  <div v-else class="space-y-5">
    <div class="flex w-full justify-between pr-6 items-center">
      <p class="font-medium leading-6 text-gray-900 text-lg">Users</p>
      <button
        v-if="loggedInUser.role === 'admin'"
        class="py-1 fixed right-8 z-50 px-2 hover:-translate-x-2 transition-all ease-in ring-2 ring-green-500 border border-white bg-green-500 text-white rounded-lg shadow-md flex items-center gap-2"
        @click="toggleModal(null, 'add')"
      >
        <UserPlusIcon class="h-5 w-5 text-white" />
        <p>Add User</p>
      </button>
    </div>
    <EasyDataTable
      :headers="headers"
      :items="users"
      alternating
      border-cell
      :rows-per-page="15"
      :sort-by="'id'"
    >
      <template #item-actions="item">
        <div class="flex gap-2">
          <button
            v-if="loggedInUser.role === 'admin'"
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-blue-500 text-white ring-2 ring-blue-500 border border-white rounded-md m-2 flex items-start gap-1"
            @click="toggleModal(item.id, 'edit')"
          >
            <PencilSquareIcon class="text-white h-4 w-4" />
            <p>Edit</p>
          </button>
          <button
            v-if="
              loggedInUser.role === 'admin' ||
              loggedInUser.role === 'general-manager'
            "
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-red-600 text-white rounded-md ring-2 ring-red-600 border border-white m-2 flex items-start gap-1"
            @click="toggleModal(item.id, 'delete')"
          >
            <TrashIcon class="text-white h-4 w-4" />
            <p>Delete</p>
          </button>
          <router-link
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-orange-500 ring-2 ring-orange-500 border border-white text-white rounded-md m-2 flex items-start gap-1"
            :to="'/workingtime/' + item.id"
            v-if="loggedInUser.role === 'admin'"
          >
            <CalendarIcon class="text-white h-4 w-4" />
            <p>Add working time</p>
          </router-link>
          <radar-spinner
            v-if="loading && user.role === 'admin'"
            :animation-duration="2000"
            :size="30"
            color="#b91c1c"
            class="my-auto"
          />
          <button
            v-if="loggedInUser.role === 'admin' && !loading"
            @click="handleClockButtonClick(item.id)"
            :class="`transition-all ease-in hover:translate-x-2 px-2 py-1 ${
              item.clockStatus
                ? 'bg-green-500 ring-green-500'
                : 'bg-purple-500 ring-purple-500'
            } text-white rounded-md ring-2  border border-white m-2 flex items-start gap-1`"
          >
            <ClockIcon class="text-white h-4 w-4" />
            <p>{{ item.clockStatus ? "Clocked in" : "Clocked out" }}</p>
          </button>
          <button
            class="transition-all ease-in hover:translate-x-2 px-2 py-1 bg-green-500 text-white rounded-md ring-2 ring-green-500 border border-white m-2 flex items-start gap-1"
            v-if="
              item.role === 'employee' &&
              (loggedInUser.role === 'admin' ||
                loggedInUser.role === 'general-manager')
            "
            @click="toggleModal(item.id, 'promote')"
          >
            <ArrowPathIcon class="text-white h-4 w-4" />
            <p>Promote</p>
          </button>
        </div>
      </template>
    </EasyDataTable>
    <AlertModal
      :modalVisible="modalVisible"
      @toggleModal="toggleModal"
      :userID="userID"
      :actionType="actionType"
      @action="action"
    />
  </div>
</template>
