<script>
import {
  fetchOneWorkingTime,
  putWorkingTime,
  postWorkingTime,
  deleteWorkingTime,
} from "../api/workingtimeApi";
import { useToast } from "vue-toastification";
import { requestUserById } from "../api/userApi";
const toast = useToast();

export default {
  data() {
    return {
      workingtime: {},
      user: {},
    };
  },
  methods: {
    async getOneWorkingTime() {
      const data = await fetchOneWorkingTime(
        this.$route.params.userId,
        this.$route.params.workingtimeId
      );
      data.data && (this.workingtime = data.data);
    },
    async createWorkingTime(e) {
      e.preventDefault();
      const data = await postWorkingTime(
        this.$route.params.userId,
        this.workingtime
      );
      if (data.data) {
        this.workingtime = data.data;
        this.$route.params.workingtimeId = this.workingtime.id;
        toast.success("workingtime created successfully");
      } else {
        toast.error("Failed to create workingtime.");
      }
    },
    async updateWorkingTime(e) {
      e.preventDefault();
      const data = await putWorkingTime(
        this.$route.params.workingtimeId,
        this.workingtime
      );
      if (data) {
        toast.success("update successfully");
      }
    },
    async deleteWorkingTime(e) {
      e.preventDefault();
      const request = await deleteWorkingTime(this.$route.params.workingtimeId);
      if (request) {
        this.$route.params.workingtimeId = this.workingtime.id;
        toast.success("Deleted workingtime successfully");
        this.workingtime = {};
      } else toast.error("Failed to delete user.");
    },
    async getUserById() {
      const data = await requestUserById(this.$route.params.userId);
      data && (this.user = data);
    },
  },

  created() {
    if (this.$route.params.userId && this.$route.params.workingtimeId) {
      this.getOneWorkingTime();
    }
    if (this.$route.params.userId) this.getUserById();
  },
};
</script>

<template>
  <div class="mt-10 sm:mt-0">
    <div class="space-y-12">
      <div class="px-4 sm:px-0">
        <h3 class="text-lg font-medium leading-6 text-gray-900">
          Workingtime form
        </h3>
        <p v-if="workingtime.id" class="mt-1 text-sm text-gray-600">
          You can update this workingtime here.
        </p>
        <p v-else class="mt-1 text-sm text-gray-600">
          You can create a workingtime here.
        </p>
      </div>
      <form action="#" method="POST">
        <div class="overflow-hidden shadow sm:rounded-lg border">
          <div class="bg-white px-4 py-5 sm:p-6">
            <div class="grid grid-cols-6 gap-6">
              <div class="col-span-2 space-y-1 text-sm font-medium">
                <p class="text-gray-700">User ID</p>
                <div class="border p-2 rounded-lg shadow-sm bg-gray-100/50">
                  <p>{{ user.id }}</p>
                </div>
              </div>
              <div class="col-span-2 space-y-1 text-sm font-medium">
                <p class="text-gray-700">Username</p>
                <div class="border p-2 rounded-lg shadow-sm bg-gray-100/50">
                  <p>{{ user.username }}</p>
                </div>
              </div>
              <div class="col-span-2 space-y-1 text-sm font-medium">
                <p class="text-gray-700">Email</p>
                <div class="border p-2 bg-gray-100/50 rounded-lg shadow-sm">
                  <p>{{ user.email }}</p>
                </div>
              </div>
              <div
                class="col-span-6 sm:col-span-4 shadow-sm"
                v-if="workingtime.id"
              >
                <label class="block text-sm font-medium text-gray-700"
                  >Working Time ID</label
                >
                <input
                  type="number"
                  disabled
                  v-model="workingtime.id"
                  class="mt-1 block w-full rounded-md border p-2"
                />
              </div>
              <div class="col-span-6 sm:col-span-3 shadow-sm">
                <label
                  for="first-name"
                  class="block text-sm font-medium text-gray-700"
                  >Start</label
                >
                <input
                  type="datetime-local"
                  name="first-name"
                  id="first-name"
                  v-model="workingtime.start"
                  class="mt-1 block w-full rounded-md border p-2"
                />
              </div>

              <div class="col-span-6 sm:col-span-3 shadow-sm">
                <label
                  for="last-name"
                  class="block text-sm font-medium text-gray-700"
                  >End</label
                >
                <input
                  type="datetime-local"
                  v-model="workingtime.end"
                  class="mt-1 block w-full rounded-md border p-2"
                />
              </div>
            </div>
          </div>
          <div class="bg-gray-50 px-4 py-3 text-right sm:px-6">
            <button
              v-if="workingtime.id"
              @click="deleteWorkingTime"
              type="submit"
              class="inline-flex justify-center rounded-md border border-transparent bg-red-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:red-indigo-500 focus:ring-offset-2 mr-2"
            >
              delete
            </button>

            <button
              v-if="workingtime.id"
              @click="updateWorkingTime"
              type="submit"
              class="inline-flex justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
            >
              Updade
            </button>
            <button
              v-else
              type="submit"
              @click="createWorkingTime"
              class="inline-flex justify-center rounded-md border border-transparent bg-green-500 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
            >
              Create
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>
