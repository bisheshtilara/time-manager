import axios from "axios";
import { authHeader } from "./authHeader";
const URL = "/api/clocks";

export const requestClockUser = async (id) => {
  try {
    const response = await axios.post(
      `${URL}/${id}`,
      {},
      { headers: authHeader() }
    );
    return response.data.data;
  } catch (error) {
    alert(error.message);
  }
};

export const requestUserClock = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    alert(error.message);
  }
};
