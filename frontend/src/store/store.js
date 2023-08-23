import { reactive } from "vue";
import { router } from "../main";
import { VueCookieNext } from "vue-cookie-next";
import axios from "axios";
import { useToast } from "vue-toastification";
const toast = useToast();

export const store = reactive({
  user: VueCookieNext.getCookie("user") || null,
  async authenticateUser(email, password) {
    try {
      const response = await axios.post(
        `http://localhost:4000/api/users/login`,
        {
          email,
          password,
        }
      );
      this.user = {
        token: response.data.token,
        email: response.data.email,
        username: response.data.username,
        role: response.data.role,
        userID: response.data.userID,
      };
      VueCookieNext.setCookie("user", this.user);
      router.push("/");
      location.reload();
    } catch (error) {
      toast.error("Invalid credentials");
    }
  },
  async signUpuser(email, username, password) {
    try {
      const response = await axios.post(
        `http://localhost:4000/api/users/signup`,
        {
          email,
          username,
          password,
          role: "employee",
        }
      );
      this.authenticateUser(email, password);
    } catch (error) {
      toast.error("User already exists");
    }
  },
  async logout() {
    VueCookieNext.removeCookie("user");
    this.user = null;
    router.push("/signin");
    location.reload();
  },
  setUpdatedCookie(newUser) {
    VueCookieNext.setCookie("user", newUser);
    this.user = newUser;
  },
});
