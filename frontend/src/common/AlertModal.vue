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
                <div class="sm:flex sm:items-start">
                  <div
                    :class="`${
                      actionType === 'delete'
                        ? 'bg-red-100'
                        : actionType === 'edit'
                        ? 'bg-blue-100'
                        : 'bg-green-100'
                    } mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full  sm:mx-0 sm:h-10 sm:w-10`"
                  >
                    <ExclamationTriangleIcon
                      v-if="actionType === 'delete'"
                      class="h-6 w-6 text-red-600"
                      aria-hidden="true"
                    />
                    <ArrowPathIcon
                      v-else-if="actionType === 'edit'"
                      class="h-6 w-6 text-blue-600"
                      aria-hidden="false"
                    />
                    <UserPlusIcon
                      v-else
                      class="h-6 w-6 text-green-600"
                      aria-hidden="false"
                    />
                  </div>
                  <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                    <DialogTitle
                      as="h3"
                      class="text-lg font-medium leading-6 text-gray-900"
                      >{{ getText() }} user</DialogTitle
                    >
                    <div class="mt-2">
                      <p class="text-sm text-gray-500">
                        Are you sure you want to
                        <span>{{ getText(true) }}</span>
                        this user? This action is permanent and cannot be
                        undone.
                      </p>
                      <div
                        v-if="
                          actionType !== 'delete' && actionType !== 'promote'
                        "
                        class="grid grid-cols-2 gap-2 pt-4"
                      >
                        <input
                          type="text"
                          :class="`border rounded-lg p-2 placeholder:text-sm font-medium text-sm italic px-2 ${
                            actionType === 'add'
                              ? 'focus:outline-green-500'
                              : 'focus:outline-blue-500'
                          } `"
                          placeholder="Username"
                          v-model="username"
                        />
                        <div
                          class="w-full relative"
                          v-if="actionType === 'add' || actionType === 'edit'"
                        >
                          <button
                            :class="`border w-full rounded-lg p-2 text-sm px-2 italic
                               focus:outline-green-500 text-start font-medium`"
                            placeholder="Role"
                            @click="roleDropDown = true"
                          >
                            {{ role ? role : "Select Role" }}
                          </button>
                          <div
                            v-if="roleDropDown"
                            class="absolute mt-1 overflow-y-scroll max-h-36 border w-full bg-white rounded-lg"
                          >
                            <div
                              v-for="role in roles"
                              :key="role"
                              class="flex font-light italic items-center justify-between p-1 border text-sm m-1 rounded-lg px-3 cursor-pointer hover:bg-gray-200"
                              @click="roleSelected(role)"
                            >
                              <p>{{ role.role }}</p>
                              <input type="checkbox" :checked="role.checked" />
                            </div>
                          </div>
                        </div>
                        <input
                          type="email"
                          :class="`border rounded-lg p-2 font-medium text-sm italic placeholder:text-sm px-2 ${
                            actionType === 'add'
                              ? 'focus:outline-green-500'
                              : 'focus:outline-blue-500'
                          } `"
                          placeholder="Email"
                          v-model="email"
                        />
                        <input
                          type="password"
                          :class="`border rounded-lg p-2 placeholder:text-sm px-2 italic text-sm
                               focus:outline-green-500`"
                          placeholder="Password"
                          v-model="password"
                          v-if="actionType === 'add' || actionType === 'edit'"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div
                class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6"
              >
                <button
                  type="button"
                  :class="`${
                    actionType === 'delete'
                      ? 'bg-red-500 focus:ring-red-500 hover:bg-red-700'
                      : actionType === 'edit'
                      ? 'bg-blue-500'
                      : 'bg-green-500'
                  } inline-flex w-full justify-center rounded-md border border-transparent  px-4 py-2 text-base font-medium text-white shadow-sm  focus:outline-none focus:ring-2  focus:ring-offset-2 sm:ml-3 sm:w-auto sm:text-sm`"
                  @click="
                    emit(
                      'action',
                      userID,
                      actionType,
                      username,
                      email,
                      role,
                      password
                    )
                  "
                >
                  <p>
                    {{
                      actionType === "delete"
                        ? "Delete"
                        : actionType === "edit"
                        ? "Update"
                        : actionType === "promote"
                        ? "Promote"
                        : "Add"
                    }}
                  </p>
                </button>
                <button
                  type="button"
                  class="mt-3 inline-flex w-full justify-center rounded-md border border-gray-300 bg-white px-4 py-2 text-base font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm"
                  @click="emit('toggleModal')"
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
  ArrowPathIcon,
  UserPlusIcon,
} from "@heroicons/vue/24/outline";
import { ref } from "vue";
const props = defineProps({
  modalVisible: {},
  userID: {},
  actionType: {},
});
const emit = defineEmits([
  "toggleModal",
  "action",
  "changeEmail",
  "changeUsername",
]);
const email = ref();
const username = ref();
const role = ref();
const password = ref();

const roleDropDown = ref(false);

const getText = (lowercase = false) => {
  if (props.actionType === "delete") {
    return lowercase ? "delete" : "Delete";
  } else if (props.actionType === "edit") {
    return lowercase ? "update" : "Update";
  } else if (props.actionType === "promote")
    return lowercase ? "promote" : "Promote";
  else {
    return lowercase ? "add" : "Add";
  }
};

const roles = ref([
  { role: "manager", checked: false },
  { role: "general-manager", checked: false },
  { role: "employee", checked: false },
]);
const roleSelected = (selectedRole) => {
  roles.value.forEach((r) => {
    if (r.role === selectedRole.role) r.checked = true;
    else r.checked = false;
  });
  role.value = selectedRole.role;
  roleDropDown.value = false;
};
</script>
