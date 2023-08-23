import { router } from "../main";
import axios from "axios";

export const requestLogin = async (email, password) => {
  try {
    const response = await axios.post(`/api/users/login`, {
      email,
      password,
    });
    localStorage.setItem("user", JSON.stringify(response.data));
    router.push("/");
  } catch (error) {
    alert(error);
  }
};

export const requestSignup = async (email, username, password) => {
  try {
    await axios.post(`/api/users/signup`, {
      email,
      username,
      password,
      role: "employee",
    });
    await requestLogin(email, password);
  } catch (error) {
    alert(error);
  }
};

export const requestLogout = () => {
  localStorage.clear();
  router.push("/signin");
};
