import axios from "axios";
import { authHeader } from "./authHeader";
import { useToast } from "vue-toastification";
import URL_API from "../constants/api.js";

const URL = URL_API + "/api/workingtimes";
const toast = useToast();

export const getAllWorkingTimes = async () => {
  try {
    const response = await axios.get(`${URL}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

// export const deleteWorkingTime = async (id) => {
//   const response = await axios.delete(`${URL}/${id}`);
//   return response.data;
// };

export const fetchOneWorkingTime = async (id, workingtimeId) => {
  try {
    const response = await axios.get(`${URL}/${id}/${workingtimeId}`, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    return;
  }
};

export const postWorkingTime = async (userId, workingtime) => {
  try {
    const response = await axios.post(
      `${URL}/${userId}`,
      {
        working_time: workingtime,
      },
      {
        headers: authHeader(),
      }
    );
    return response.data;
  } catch (error) {
    return;
  }
};

export const putWorkingTime = async (workingtimeId, workingtime) => {
  try {
    const response = await axios.put(
      `${URL}/${workingtimeId}`,

      {
        working_time: workingtime,
      },
      {
        headers: authHeader(),
      }
    );
    return response.data;
  } catch (error) {
    return;
  }
};

export const deleteWorkingTime = async (workingtimeID) => {
  try {
    const response = await axios.delete(`${URL}/${workingtimeID}`, {
      headers: authHeader(),
    });
    return response;
  } catch (error) {
    return;
  }
};

export const requestWorkingTimeOfUser = async (userId) => {
  try {
    const response = await axios.get(`${URL}/${userId}`, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    return;
  }
};
