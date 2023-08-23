import axios from "axios";
import { authHeader } from "./authHeader";
const URL = "/api/users";

export const requestUpdateUser = async (id, user) => {
  try {
    const response = await axios.put(`${URL}/${id}`, user, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    alert(error.message);
  }
};

export const requestCheckPassword = async (id, password) => {
  try {
    const response = await axios.post(
      `${URL}/${id}/check-password`,
      { password },
      {
        headers: authHeader(),
      }
    );
    return response.data.response;
  } catch (error) {
    return;
  }
};

export const requestDeleteUser = async (id) => {
  try {
    const response = await axios.delete(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    console(error.response.data);
  }
};
