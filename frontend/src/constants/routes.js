import ChartManager from "../components/ChartManager.vue";
import User from "../components/User.vue";
import Workingtime from "../components/Workingtime.vue";
import Workingtimes from "../components/Workingtimes.vue";
import Signin from "../components/Signin.vue";
import Signup from "../components/Signup.vue";
import Teams from "../components/Teams.vue";
import { store } from "../store/store";
import {
  ChartPieIcon,
  ClockIcon,
  UsersIcon,
  CalendarIcon,
  UserGroupIcon,
} from "@heroicons/vue/24/outline";
import {
  ChartPieIcon as CharPieIconSolid,
  ClockIcon as ClockIconSolid,
  UsersIcon as UsersIconSolid,
  CalendarIcon as CalendarIconSolid,
  UserGroupIcon as UserGroupIconSolid,
} from "@heroicons/vue/24/solid";

const user = store.user;

const routes = [
  { path: "/:pathMatch(.*)*", redirect: "/", displayInNav: false },
  {
    path: "/",
    component: ChartManager,
    name: "Dashboard",
    icon: ChartPieIcon,
    solidIcon: CharPieIconSolid,
  },
  {
    path: "/user",
    component: User,
    name: "User",
    icon: UsersIcon,
    solidIcon: UsersIconSolid,
    displayInNav:
      user && (user.role === "admin" || user.role === "general-manager")
        ? true
        : false,
  },
  {
    path: "/workingtimes",
    component: Workingtimes,
    name: "Workingtimes",
    icon: CalendarIcon,
    solidIcon: CalendarIconSolid,
    displayInNav: user && user.role === "admin" ? true : false,
  },
  {
    path: "/workingtime/:userId/:workingtimeId?",
    component: Workingtime,
    name: "Workingtime",
    displayInNav: false,
    icon: null,
  },
  {
    path: "/teams",
    component: Teams,
    name: "Teams",
    icon: UserGroupIcon,
    solidIcon: UserGroupIconSolid,
    displayInNav: user && user.role !== "employee" ? true : false,
  },
  {
    path: "/signin",
    component: Signin,
    name: "Sign in",
    icon: null,
    displayInNav: false,
  },
  {
    path: "/signup",
    component: Signup,
    name: "Sign up",
    icon: null,
    displayInNav: false,
  },
];

export default routes;
