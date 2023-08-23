<template>
  <div class="px-5">
    <p class="font-medium text-3xl pt-12">Profile</p>
    <div class="space-y-4 pt-10">
      <TextInput label="Username" type="text" v-model="username" />
      <TextInput label="Email" type="email" v-model="email" />
      <TextInput label="Password" type="password" v-model="password" />
      <div class="flex justify-center">
        <button
          @click="loading = true"
          class="border rounded-xl p-3 bg-green-500 text-white"
          :disabled="loading"
        >
          <div v-if="!loading" class="flex items-center gap-3">
            <ArrowPathIcon class="h-6 w-6" />
            <p class="text-center font-medium">Update information?</p>
          </div>
          <div v-else>
            <half-circle-spinner :size="30" color="white" />
          </div>
        </button>
      </div>
      <div v-if="loading" class="space-y-4 pt-4">
        <p class="text-red-500 pl-4" v-if="!oldPassword">
          Please enter your old password to make changes.
        </p>
        <TextInput label="Old Password" type="password" v-model="oldPassword" />
        <div class="items-center grid grid-cols-2 gap-3 px-1 text-white pt-2">
          <button
            class="border p-3 shadow-md rounded-xl bg-green-500 flex items-center justify-center gap-2 font-medium"
            @click="updateProfile"
          >
            <CheckCircleIcon class="h-5 w-5 text-white" />
            <p>Confirm</p>
          </button>
          <button
            class="border p-3 shadow-md rounded-xl bg-red-600 flex items-center justify-center gap-2 font-medium"
            @click="loading = false"
          >
            <XCircleIcon class="h-5 w-5 text-white" />
            <p>Cancel</p>
          </button>
          <button
            class="rounded-xl col-span-2 bg-red-800 p-3 shadow-md flex items-center justify-center gap-2 font-medium mt-3"
            @click="deleteProfile"
          >
            <TrashIcon class="h-5 w-5 text-white" />
            <p>Delete Account</p>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { onBeforeMount, ref } from "vue";
import TextInput from "@/common/TextInput.vue";
import {
  ArrowPathIcon,
  CheckCircleIcon,
  XCircleIcon,
  TrashIcon,
} from "@heroicons/vue/24/solid";
import { HalfCircleSpinner } from "epic-spinners";
import { useToast } from "vue-toastification";
import {
  requestUpdateUser,
  requestCheckPassword,
  requestDeleteUser,
} from "../api/userApi";
import { requestLogout } from "@/api/authApi";

const toast = useToast();
const user = JSON.parse(localStorage.getItem("user"));
const username = ref(user.username);
const email = ref(user.email);
const password = ref("");
const oldPassword = ref("");
const loading = ref(false);

const updateProfile = async () => {
  if (!oldPassword.value) {
    toast.error("Old Password Invalid");
    return;
  }
  const checkPassword = await requestCheckPassword(
    user.userID,
    oldPassword.value
  );
  if (!checkPassword) {
    toast.error("Old Password Invalid");
    return;
  }
  const updatedInfo = {};
  if (username.value.length > 0) updatedInfo.username = username.value;
  if (email.value.length > 0) updatedInfo.email = email.value;
  if (password.value.length > 0) updatedInfo.password = password.value;
  const response = await requestUpdateUser(user.userID, updatedInfo);
  loading.value = false;
  toast.success("Profile Updated");
};

const deleteProfile = async () => {
  if (!oldPassword.value) {
    toast.error("Old Password Invalid");
    return;
  }
  const checkPassword = await requestCheckPassword(
    user.userID,
    oldPassword.value
  );
  if (!checkPassword) {
    toast.error("Old Password Invalid");
    return;
  }
  const response = await requestDeleteUser(user.userID);
  loading.value = false;
  requestLogout();
};
</script>
