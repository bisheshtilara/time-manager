<template>
  <TransitionRoot as="template" :show="modalVisible">
    <Dialog as="div" class="relative z-10" @close="emit('toggleModal')">
      <TransitionChild
        as="template"
        enter="ease-out duration-300"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="ease-in duration-200"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div
          class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
        />
      </TransitionChild>

      <div class="fixed inset-0 z-10 overflow-y-auto">
        <div
          class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0"
        >
          <TransitionChild
            as="template"
            enter="ease-out duration-300"
            enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            enter-to="opacity-100 translate-y-0 sm:scale-100"
            leave="ease-in duration-200"
            leave-from="opacity-100 translate-y-0 sm:scale-100"
            leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <DialogPanel
              class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg"
            >
              <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                <div class="sm:flex sm:items-center">
                  <div
                    class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10"
                  >
                    <ArrowPathIcon
                      class="h-6 w-6 text-red-600"
                      aria-hidden="true"
                    />
                  </div>
                  <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                    <DialogTitle
                      as="h3"
                      class="text-lg font-medium leading-6 text-gray-900"
                      >Update account</DialogTitle
                    >
                  </div>
                </div>
                <div class="grid grid-cols-2 p-4 gap-2 px-6">
                  <input
                    type="text"
                    class="border rounded-lg p-2 focus:outline-none text-sm font-medium italic"
                    placeholder="Username"
                    v-model="username"
                  />
                  <input
                    type="text"
                    class="border rounded-lg p-2 focus:outline-none text-sm font-medium italic"
                    placeholder="Email"
                    v-model="email"
                  />
                  <input
                    type="password"
                    class="border rounded-lg px-2 py-1 focus:outline-none text-sm font-medium italic"
                    placeholder="Old Password"
                    v-model="previousPassword"
                  />
                  <input
                    type="password"
                    class="border rounded-lg p-2 focus:outline-none text-sm font-medium italic"
                    placeholder="Password"
                    v-model="password"
                  />
                </div>
              </div>
              <div
                class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse md:justify-between sm:px-6"
              >
                <div class="space-x-3">
                  <button
                    type="button"
                    class="mt-3 inline-flex w-full justify-center rounded-md border border-gray-300 bg-white px-4 py-2 text-base font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
                    @click="emit('toggleModal')"
                    ref="cancelButtonRef"
                  >
                    Cancel
                  </button>
                  <button
                    type="button"
                    class="inline-flex w-full justify-center rounded-md border border-transparent bg-green-500 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 sm:ml-3 sm:w-auto sm:text-sm"
                    @click="updateUserInfo()"
                  >
                    Update
                  </button>
                </div>
                <button
                  type="button"
                  class="inline-flex w-full justify-center rounded-md border border-transparent bg-red-600 px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="deleteAccount()"
                >
                  Deactivate
                </button>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { ref } from "vue";
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import { ArrowPathIcon } from "@heroicons/vue/24/solid";
import {
  requestCheckPassword,
  requestDeleteUser,
  requestUpdateUser,
} from "../api/userApi";
import { store } from "../store/store";
import { useToast } from "vue-toastification";
import { VueCookieNext } from "vue-cookie-next";

const props = defineProps({
  modalVisible: {},
});
const emit = defineEmits(["toggleModal"]);
const user = store.user;

const username = ref(user.username);
const email = ref(user.email);
const password = ref("");
const previousPassword = ref("");
const toast = useToast();

const updateUserInfo = async () => {
  const data = {};
  if (username.value.length > 0) data.username = username.value;
  if (email.value.length > 0) data.email = email.value;
  if (password.value.length > 0) data.password = password.value;
  if (previousPassword.value.length === 0) {
    toast.error("Please enter your password to delete your account");
    return;
  }
  if (previousPassword.value.length > 0) {
    const response = await requestCheckPassword(
      user.userID,
      previousPassword.value
    );
    if (response) {
      await requestUpdateUser(user.userID, data);
      const newUser = VueCookieNext.getCookie("user");
      newUser.email = data.email;
      newUser.username = data.username;
      store.setUpdatedCookie(newUser);
      toast.success("User Updated Successfully");
      emit("toggleModal");
      location.reload();
    } else toast.error("Wrong Old Password");
  }
};

const deleteAccount = async () => {
  if (previousPassword.value.length === 0) {
    toast.error("Please enter your password to delete your account");
    return;
  }
  if (previousPassword.value.length > 0) {
    const response = await requestCheckPassword(
      user.userID,
      previousPassword.value
    );
    if (response) {
      emit("toggleModal");
      await requestDeleteUser(user.userID);
      await store.logout();
    } else toast.error("Wrong Old Password");
  }
};
</script>
