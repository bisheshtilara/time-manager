import axios from "axios";
import { authHeader } from "./authHeader";

const URL = "/api/workingtimes";

export const requestUserWorkingTimes = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    alert(error.message);
  }
};
