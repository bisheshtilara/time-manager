import { createApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "./App.vue";
import "./style.css";
import routes from "./constants/routes";
import Vue3EasyDataTable from "vue3-easy-data-table";
import Toast from "vue-toastification";
import "vue3-easy-data-table/dist/style.css";
import "vue-toastification/dist/index.css";
import { store } from "./store/store";
import { VueCookieNext } from "vue-cookie-next";

export const router = createRouter({
  history: createWebHistory(),
  routes,
});

const toastOptions = {
  position: "top-right",
  timeout: 800,
  closeOnClick: true,
  pauseOnFocusLoss: true,
  pauseOnHover: true,
  draggable: true,
  draggablePercent: 0.6,
  showCloseButtonOnHover: true,
  hideProgressBar: false,
  closeButton: "button",
  icon: true,
  rtl: false,
};

const app = createApp(App);
app.use(router).mount("#app");
app.use(Toast, toastOptions);
app.use(VueCookieNext);
app.component("EasyDataTable", Vue3EasyDataTable);
VueCookieNext.config({ expire: "7d" });

router.beforeEach((to, from, next) => {
  if (to.path === "/signin" || to.path === "/signup") {
    if (!store.user) next();
    else next("/");
  } else if (store.user) {
    if (store.user.role === "employee" && to.path === "/") next();
    else if (
      store.user.role === "manager" &&
      (to.path === "/teams" || to.path === "/")
    )
      next();
    else if (
      store.user.role === "general-manager" &&
      to.path !== "/workingtimes"
    )
      next();
    else if (store.user.role === "admin") next();
    else next("/");
  } else next("/signin");
});
