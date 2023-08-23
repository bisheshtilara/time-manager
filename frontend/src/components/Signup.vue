<template>
  <div
    class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8"
  >
    <div
      class="w-full max-w-md space-y-16 lg:p-12 md:p-8 rounded-lg border shadow-lg"
    >
      <div>
        <img class="mx-auto h-20 w-auto" :src="gothamLogo" alt="Gotham" />
        <h2
          class="mt-6 text-center text-3xl font-medium tracking-tight text-gray-900"
        >
          Create an account
        </h2>
      </div>
      <form
        class="mt-8 space-y-6"
        @submit="
          (e) => {
            e.preventDefault();
            signup();
          }
        "
      >
        <div class="grid grid-cols-2 gap-4 rounded-md shadow-sm">
          <input
            type="email"
            required
            class="col-span-2 relative shadow-md block w-full appearance-none rounded-md border border-gray-300 px-3 py-3 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-red-800 focus:outline-none focus:ring-red-800 sm:text-sm"
            placeholder="Email address"
            v-model="email"
          />
          <input
            type="text"
            required
            class="col-span-2 relative shadow-md block w-full appearance-none rounded-md border border-gray-300 px-3 py-3 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-red-800 focus:outline-none focus:ring-red-800 sm:text-sm"
            placeholder="Username"
            v-model="username"
          />
          <input
            type="password"
            required
            class="relative shadow-md block w-full appearance-none rounded-md border border-gray-300 px-3 py-3 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-red-800 focus:outline-none focus:ring-red-800 sm:text-sm"
            placeholder="Password"
            v-model="password"
          />
          <input
            type="password"
            required
            class="relative shadow-md block w-full appearance-none rounded-md border border-gray-300 px-3 py-3 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-red-800 focus:outline-none focus:ring-red-800 sm:text-sm"
            placeholder="Confirm Password"
            v-model="confirmPassword"
          />
        </div>
        <button
          type="submit"
          class="border-2 border-white ring-2 ring-red-800 group relative shadow-md shadow-black flex w-full justify-center transition-all ease-in rounded-md bg-red-800 py-2 px-4 text-sm font-medium text-white hover:translate-x-2"
        >
          <span class="absolute inset-y-0 left-0 flex items-center pl-3">
            <LockClosedIcon class="h-5 w-5 text-white" />
          </span>
          Sign up
          <span class="absolute inset-y-0 right-0 flex items-center pr-3">
            <ArrowRightIcon class="h-5 w-5 text-white" />
          </span>
        </button>
        <div class="text-center text-sm">Or</div>
        <div class="text-center">
          <p class="font-light">
            Already have an account?
            <span
              class="text-red-800 font-medium cursor-pointer hover:underline hover:italic"
              @click="$router.push('/signin')"
              >Sign in</span
            >
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { LockClosedIcon, ArrowRightIcon } from "@heroicons/vue/20/solid";
import { ref } from "vue";
import { useToast } from "vue-toastification";
import gothamLogo from "../assets/gotham.png";
import { store } from "../store/store";

const toast = useToast();
const email = ref("");
const username = ref("");
const password = ref("");
const confirmPassword = ref("");

const signup = async () => {
  if (password.value.length < 6) {
    toast.error("Password must be at least 6 characters");
    return;
  }
  if (password.value !== confirmPassword.value) {
    toast.error("Passwords do not match");
    return;
  }
  store.signUpuser(email.value, username.value, password.value);
};
</script>
