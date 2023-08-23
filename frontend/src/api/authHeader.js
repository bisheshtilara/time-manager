import { VueCookieNext } from "vue-cookie-next";

export const authHeader = () => {
  const user = VueCookieNext.getCookie("user");
  if (user && user.token) return { Authorization: "Bearer " + user.token };
  else return {};
};
