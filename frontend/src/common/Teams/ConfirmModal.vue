<template>
  <TransitionRoot as="template" :show="modalVisible">
    <Dialog as="div" class="relative z-10" @close="emit('closeModal')">
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
                <div class="sm:flex sm:items-start">
                  <div
                    :class="`mx-auto flex h-12 w-12 flex-shrink-0 ${
                      actionType === 'remove' || actionType === 'delete'
                        ? 'bg-red-100'
                        : 'bg-green-100'
                    } items-center justify-center rounded-full sm:mx-0 sm:h-10 sm:w-10`"
                  >
                    <ExclamationTriangleIcon
                      class="h-6 w-6 text-red-600"
                      aria-hidden="true"
                      v-if="actionType === 'remove' || actionType === 'delete'"
                    />
                    <UserGroupIcon v-else class="h-6 w-6 text-green-500" />
                  </div>
                  <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                    <DialogTitle
                      as="h3"
                      class="text-lg font-medium leading-6 text-gray-900"
                      >{{
                        actionType === "update"
                          ? "Update team"
                          : actionType === "remove"
                          ? "Remove user(s)"
                          : actionType === "add"
                          ? "Add team"
                          : "Delete team"
                      }}</DialogTitle
                    >
                    <div class="mt-2">
                      <p class="text-sm text-gray-500">
                        Are you sure you want to
                        {{
                          actionType === "update"
                            ? "update"
                            : actionType === "remove"
                            ? "remove"
                            : actionType === "add"
                            ? "add"
                            : "delete"
                        }}
                        the selected
                        {{ actionType === "remove" ? "user(s)" : "team" }}? The
                        selected
                        {{ actionType === "remove" ? "user(s)" : "team" }} will
                        be permanently
                        {{
                          actionType === "update"
                            ? "updated"
                            : actionType === "remove"
                            ? "removed from this team"
                            : actionType === "add"
                            ? "added"
                            : "deleted"
                        }}. This action cannot be undone.
                      </p>
                      <input
                        v-if="actionType === 'add'"
                        placeholder="Team name"
                        type="text"
                        class="border rounded-lg p-1 placeholder:text-sm px-2 text-green-500 focus:outline-green-500 mt-1"
                        v-model="teamName"
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div
                class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6"
              >
                <button
                  type="button"
                  :class="`inline-flex w-full justify-center rounded-md border border-transparent ${
                    actionType === 'update' || actionType === 'add'
                      ? 'bg-green-500 focus:ring-green-500'
                      : 'bg-red-500 focus:ring-red-500'
                  } px-4 py-2 text-base font-medium text-white shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2  focus:ring-offset-2 sm:ml-3 sm:w-auto sm:text-sm`"
                  @click="
                    actionType === 'update'
                      ? emit('updateTeam')
                      : actionType === 'remove'
                      ? emit('removeUsers')
                      : actionType === 'add'
                      ? emit('addTeam', teamName)
                      : emit('deleteTeam')
                  "
                >
                  {{
                    actionType === "update"
                      ? "Update"
                      : actionType === "remove"
                      ? "Remove"
                      : actionType === "add"
                      ? "Add"
                      : "Delete"
                  }}
                </button>
                <button
                  type="button"
                  class="mt-3 inline-flex w-full justify-center rounded-md border border-gray-300 bg-white px-4 py-2 text-base font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="emit('closeModal')"
                  ref="cancelButtonRef"
                >
                  Cancel
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
import {
  Dialog,
  DialogPanel,
  DialogTitle,
  TransitionChild,
  TransitionRoot,
} from "@headlessui/vue";
import {
  ExclamationTriangleIcon,
  UserGroupIcon,
} from "@heroicons/vue/24/outline";
import { ref } from "vue";

const props = defineProps({
  modalVisible: {},
  teamID: {},
  actionType: {},
});
const teamName = ref("");

const emit = defineEmits([
  "deleteTeam",
  "updateTeam",
  "removeUsers",
  "addTeam",
  "closeModal",
]);
</script>
