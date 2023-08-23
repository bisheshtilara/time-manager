import { createApp } from "vue";
import { createRouter, createWebHashHistory } from "vue-router";
import App from "./App.vue";
import { routes } from "./routes";
import "./style.css";
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";

export const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

const toastOptions = {
  position: "bottom-center",
  timeout: 2000,
  closeOnClick: true,
  draggable: true,
  draggablePercent: 0.6,
  hideProgressBar: true,
  closeButton: "button",
  maxToasts: 1,
  icon: true,
  transition: "Vue-Toastification__fade",
};

const app = createApp(App);
app.use(router).mount("#app");
app.use(Toast, toastOptions);

router.beforeEach((to, from, next) => {
  const user = JSON.parse(localStorage.getItem("user"));
  if (to.path === "/signin" || to.path === "/signup") {
    if (!user) next();
    else next("/");
  } else {
    if (user) next();
    else next("/signin");
  }
});
