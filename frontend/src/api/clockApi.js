import axios from "axios";
import { authHeader } from "./authHeader";
import { useToast } from "vue-toastification";
import { VueCookieNext } from "vue-cookie-next";
import URL_API from "../constants/api.js";

const user = VueCookieNext.getCookie("user");
const token = user ? user.token : null;
const toast = useToast();
const URL = URL_API + "/api/clocks";
const UrlUser = URL_API + "/api/users";

export const getClockByUserId = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const getUserById = async (id) => {
  try {
    const response = await axios.get(`${UrlUser}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestClockStatusByUserId = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data.status;
  } catch (error) {
    return;
  }
};

export const requestClockUser = async (id) => {
  try {
    const response = await axios.post(
      `${URL}/${id}`,
      {},
      {
        headers: authHeader(),
      }
    );
    return response.data;
  } catch (error) {
    return;
  }
};

//TODO: delete this later
export const clockUserId = async (id) => {
  try {
    const response = await axios.post(
      `${URL}/${id}`,
      {},
      {
        headers: authHeader(),
      }
    );
    return response.data;
  } catch (error) {
    return;
  }
};
