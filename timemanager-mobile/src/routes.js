import { UserIcon, ClockIcon, HomeModernIcon } from "@heroicons/vue/24/outline";
import {
  UserIcon as UserIconSolid,
  ClockIcon as ClockIconSolid,
  HomeModernIcon as HomeModernIconSolid,
} from "@heroicons/vue/24/solid";

export const routes = [
  {
    path: "/signin",
    component: () => import("./components/Signin.vue"),
    name: "Signin",
    displayInNav: false,
  },
  {
    path: "/signup",
    component: () => import("./components/Signup.vue"),
    name: "Signup",
    displayInNav: false,
  },
  {
    path: "/",
    component: () => import("./components/Dashboard.vue"),
    name: "Dashboard",
    icon: HomeModernIcon,
    solidIcon: HomeModernIconSolid,
  },
  {
    path: "/clock",
    name: "Clock",
    component: () => import("./components/Clock.vue"),
    icon: ClockIcon,
    solidIcon: ClockIconSolid,
  },
  {
    path: "/profile",
    name: "Profile",
    component: () => import("./components/Profile.vue"),
    icon: UserIcon,
    solidIcon: UserIconSolid,
  },
];
