<template>
  <div class="h-screen flex flex-col justify-center gap-10 pb-32 px-5">
    <div class="flex flex-col items-center gap-4">
      <img :src="gothamLogo" class="h-20" />
      <p class="text-center font-medium text-xl">Create an account</p>
    </div>
    <div class="space-y-5 px-1">
      <TextInput label="Username" type="text" v-model="username" />
      <TextInput label="Email" type="email" v-model="email" />
      <TextInput label="Password" type="password" v-model="password" />
      <TextInput
        label="Confirm Password"
        type="password"
        v-model="confirmPassword"
      />
      <button
        class="shadow-md italic shadow-black flex border-2 border-white ring-2 ring-red-800 items-center justify-between w-full text-base bg-red-800 text-white py-3 px-5 rounded-xl font-medium"
        @click="signup"
      >
        <LockClosedIcon class="h-6" />
        <p>Sign up</p>
        <ArrowSmallRightIcon class="h-6" />
      </button>
      <p class="text-center">Or</p>
      <p class="text-center text-base">
        Already have an account?
        <span class="font-semibold" @click="$router.push('/')">Sign in</span>.
      </p>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import gothamLogo from "../assets/gotham.png";
import TextInput from "@/common/TextInput.vue";
import { LockClosedIcon, ArrowSmallRightIcon } from "@heroicons/vue/24/solid";
import { useToast } from "vue-toastification";
import { requestSignup } from "@/api/authApi";

const username = ref("");
const email = ref("");
const password = ref("");
const confirmPassword = ref("");
const toast = useToast();

const signup = async () => {
  if (password.value.length < 6) {
    toast.error("Password must be at least 6 characters");
    return;
  }
  if (password.value !== confirmPassword.value) {
    toast.error("Passwords do not match");
    return;
  }
  await requestSignup(email.value, username.value, password.value);
};
</script>
