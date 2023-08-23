<template>
  <radar-spinner
    v-if="loading"
    :animation-duration="2000"
    :size="100"
    color="#b91c1c"
    class="m-auto"
  />
  <div
    v-if="!loading"
    class="flex items-center border rounded-tl-lg rounded-tr-lg p-2"
  >
    <div class="flex items-center overflow-x-scroll mx-4 gap-2 p-1 w-1/2">
      <div
        v-for="user in newMembers"
        class="border-2 border-white ring-2 ring-green-500 bg-green-500 text-white rounded-lg text-xs text-center flex items-center justify-center p-1"
      >
        <p>{{ user.username }}</p>
      </div>
      <div
        v-for="user in selectedUsers"
        class="border-2 border-white ring-2 ring-red-600 bg-red-600 text-white rounded-lg text-xs text-center flex items-center justify-center p-1"
      >
        <p>{{ user.username }}</p>
      </div>
    </div>
    <div class="flex gap-4 items-center w-1/2">
      <div
        class="relative flex-grow"
        v-on-click-outside="() => (dropdown = false)"
      >
        <input
          type="text"
          :placeholder="dropdown ? 'Search user' : 'Click here to select users'"
          class="focus:outline-none border-b-2 rounded-b-lg w-full py-1 px-2"
          @focus="dropdown = true"
          v-model="searchValue"
          :disabled="selectedUsers.length > 0"
        />
        <!-- Drop down starts here -->
        <div
          :class="`absolute -left-2 border z-10 bg-white rounded-lg shadow-lg w-full overflow-y-scroll max-h-60 space-y-1 m-2 px-2 py-2 transition-all ease-in-out origin-top ${
            dropdown ? 'scale-100' : 'scale-0 hidden'
          }`"
        >
          <div
            v-for="user in usersToDisplay"
            :class="`text-xs p-2 border rounded-lg cursor-pointer transition-all ease-in hover:bg-gray-200 ${
              user.checked ? 'bg-gray-200' : 'bg-white'
            }`"
            @click="
              () => {
                user.checked = !user.checked;
                handleNewMembers();
              }
            "
          >
            <div class="flex items-center justify-between">
              <div class="flex gap-1 truncate mr-2">
                <p>{{ user.id }}.</p>
                <p>{{ user.email }},</p>
                <p>{{ user.username }}</p>
              </div>
              <input
                type="checkbox"
                :checked="user.checked"
                @change="user.checked = !user.checked"
              />
            </div>
          </div>
        </div>
        <!-- Drop down ends here -->
      </div>
      <button
        :disabled="selectedUsers.length === 0 && newMembers.length === 0"
        :class="`rounded-lg flex items-center gap-1 p-1 text-sm text-white transition-all ease-in hover:-translate-y-1 ${
          selectedUsers.length > 0
            ? 'bg-red-600 ring-red-600 '
            : 'bg-green-500 ring-green-500 '
        } border-2 border-white ring-2`"
        @click="
          selectedUsers.length > 0 ? triggerRemoveUser() : triggerUpdate()
        "
      >
        <UserPlusIcon class="h-4 w-4" />
        <p>{{ selectedUsers.length > 0 ? "Remove users" : "Update team" }}</p>
      </button>
      <button
        class="rounded-lg flex items-center gap-1 p-1 border-2 text-sm transition-all ease-in hover:-translate-y-1 text-white bg-red-600 border-white ring-2 ring-red-600"
        @click="triggerDelete"
      >
        <TrashIcon class="h-4 w-4" />
        <p>Delete team</p>
      </button>
      <button
        @click="clockTeam"
        :disabled="someClockedIn"
        :class="`ring-2 text-white ${
          allClockedIn
            ? 'bg-green-500 ring-green-500'
            : someClockedIn
            ? 'bg-red-700 ring-red-700'
            : 'bg-purple-500 ring-purple-500'
        } rounded-full border-2 border-white transition-all ease-in hover:-translate-y-1`"
      >
        <ClockIcon class="h-7 w-7" aria-hidden="true" />
      </button>
    </div>
  </div>
  <EasyDataTable
    v-if="!loading"
    :headers="headers"
    :items="users"
    alternating
    border-cell
    :rows-per-page="15"
    sort-by="id"
    v-model:items-selected="selectedUsers"
  />
  <ConfirmModal
    :modalVisible="modalVisible"
    :actionType="actionType"
    @updateTeam="updateTeam"
    @deleteTeam="
      () => {
        emit('deleteTeam', teamID);
        modalVisible = false;
      }
    "
    @closeModal="() => (modalVisible = false)"
    @removeUsers="removeUsers"
  />
</template>

<script setup>
import { UserPlusIcon, TrashIcon } from "@heroicons/vue/24/solid";
import { ClockIcon } from "@heroicons/vue/24/outline";
import { onBeforeMount, ref, watchEffect } from "vue";
import { requestAllUsers, requestUserById } from "../../api/userApi";
import { vOnClickOutside } from "@vueuse/components";
import ConfirmModal from "./ConfirmModal.vue";
import { requestUpdateTeam } from "../../api/teamsApi";
import { useToast } from "vue-toastification";
import { RadarSpinner } from "epic-spinners";
import {
  requestClockStatusByUserId,
  requestClockUser,
} from "../../api/clockApi";

const toast = useToast();
const dropdown = ref(false);
const users = ref([]);
const allUsers = ref([]);
const usersToDisplay = ref([]);
const searchValue = ref("");
const selectedUsers = ref([]);
const newMembers = ref([]);
const modalVisible = ref(false);
const actionType = ref();
const headers = [
  { text: "ID", value: "id", sortable: true },
  { text: "USERNAME", value: "username" },
  { text: "EMAIL", value: "email" },
];

const allClockedIn = ref(false);
const someClockedIn = ref(false);

const loading = ref(true);
const clockStatuses = ref([]);
const emit = defineEmits(["deleteTeam", "stopTableLoading"]);
const props = defineProps({
  team: {},
  name: {},
  teamID: {},
  teamName: {},
  tableLoading: {},
  teamCreator: {},
});

const handleNewMembers = () => {
  newMembers.value = usersToDisplay.value.filter((user) => user.checked);
};

const getAllUsers = async () => {
  const data = props.team;
  for (const user of data) {
    let userData = await requestUserById(user);
    userData = {
      ...userData,
      checked: false,
      searchValue: userData.email + userData.username,
    };
    users.value.push(userData);
  }
  for (const user of users.value) {
    const response = await requestClockStatusByUserId(user.id);
    if (response) user.clockStatus = true;
    else user.clockStatus = false;
    clockStatuses.value.push(user.clockStatus);
  }
  userClockStatuses();
  loading.value = false;
  emit("stopTableLoading");
};

const userClockStatuses = () => {
  const uniqueClockStatuses = [...new Set(clockStatuses.value)];
  if (uniqueClockStatuses.length === 1) {
    if (uniqueClockStatuses[0] === true) {
      allClockedIn.value = true;
    } else {
      allClockedIn.value = false;
    }
  } else {
    someClockedIn.value = true;
  }
};

const fetchAllUsers = async () => {
  let data = await requestAllUsers();
  data = data.filter((user) => !props.team.includes(user.id));
  data = data.map((user) => {
    return {
      ...user,
      checked: false,
      searchValue: user.email + user.username,
    };
  });
  allUsers.value = data;
  usersToDisplay.value = data;
};

onBeforeMount(() => {
  getAllUsers();
  fetchAllUsers();
});

watchEffect(() => {
  if (!searchValue || searchValue === "") {
    usersToDisplay.value = allUsers.value;
  } else if (searchValue) {
    usersToDisplay.value = allUsers.value.filter((user) =>
      user.searchValue.toLowerCase().includes(searchValue.value.toLowerCase())
    );
  }
});

//functions to make request to backend
const updateTeam = async () => {
  users.value = [...users.value, ...newMembers.value];
  usersToDisplay.value = usersToDisplay.value.filter(
    (user) => !newMembers.value.includes(user)
  );
  const updatedTeamId = newMembers.value.map((user) => user.id);
  const finalTeam = [...props.team, ...updatedTeamId];
  const data = {
    name: props.teamName,
    users: finalTeam,
    creator: props.teamCreator,
  };
  await requestUpdateTeam(props.teamID, data);
  newMembers.value = [];
  modalVisible.value = false;
  toast.success("Team updated successfully");
};

const removeUsers = async () => {
  users.value.forEach((user) => {
    selectedUsers.value.forEach((selectedUser) => {
      if (user.id === selectedUser.id) {
        users.value = users.value.filter((user) => user.id !== selectedUser.id);
      }
    });
  });
  const finalTeam = users.value.map((user) => user.id);
  const data = {
    name: props.teamName,
    users: finalTeam,
    creator: props.teamCreator,
  };
  usersToDisplay.value = [...usersToDisplay.value, ...selectedUsers.value];
  await requestUpdateTeam(props.teamID, data);
  modalVisible.value = false;
  selectedUsers.value = [];
  toast.success("Users removed successfully");
};

const clockTeam = async () => {
  for (const user of users.value) {
    const response = await requestClockUser(user.id);
    if (response.data.status) user.clockStatus = true;
    else user.clockStatus = false;
  }
  const uniqueClockStatuses = [
    ...new Set(users.value.map((user) => user.clockStatus)),
  ];
  if (uniqueClockStatuses.length === 1) {
    if (uniqueClockStatuses[0] === true) {
      allClockedIn.value = true;
      toast.success(`${props.teamName} clocked in successfully`);
    } else {
      allClockedIn.value = false;
      toast.success(`${props.teamName} clocked out successfully`);
    }
  } else {
    someClockedIn.value = true;
  }
};

//Trigger functions for modal
const triggerUpdate = () => {
  actionType.value = "update";
  modalVisible.value = true;
};

const triggerDelete = () => {
  actionType.value = "delete";
  modalVisible.value = true;
};

const triggerRemoveUser = () => {
  actionType.value = "remove";
  modalVisible.value = true;
};
</script>
