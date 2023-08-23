import axios from "axios";
import { authHeader } from "./authHeader";
import { useToast } from "vue-toastification";
import URL_API from "../constants/api.js";
import { requestAllTeams, requestUpdateTeam } from "./teamsApi";

const URL = URL_API + "/api/users";
const toast = useToast();

export const requestAllUsers = async () => {
  try {
    const response = await axios.get(`${URL}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestDeleteUser = async (id) => {
  try {
    const teams = await requestAllTeams();
    for (const team of teams) {
      if (team.users.includes(id)) {
        team.users = team.users.filter((user) => user !== id);
        await requestUpdateTeam(team.id, team);
      }
    }
    const response = await axios.delete(`${URL}/${id}`, {
      headers: authHeader(),
    });

    return response.data;
  } catch (error) {
    return;
  }
};

export const requestUpdateUser = async (id, user) => {
  try {
    const response = await axios.put(`${URL}/${id}`, user, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    return;
  }
};

export const requestAddUser = async (user) => {
  try {
    const response = await axios.post(`${URL}`, user, {
      headers: authHeader(),
    });
    return response.data;
  } catch (error) {
    return;
  }
};

export const requestUserById = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestUserByEmailAndUsername = async (email, username) => {
  try {
    const response = await axios.get(
      `${URL}?email=${email}&username=${username}`,
      {
        headers: authHeader(),
      }
    );
    return response.data.data;
  } catch (error) {
    return;
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
