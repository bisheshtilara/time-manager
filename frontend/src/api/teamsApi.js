import axios from "axios";
import { authHeader } from "./authHeader";
import { useToast } from "vue-toastification";
import URL_API from "../constants/api.js";

const URL = URL_API + "/api/teams";
const toast = useToast();

export const requestAllTeams = async () => {
  try {
    const response = await axios.get(`${URL}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestTeamById = async (id) => {
  try {
    const response = await axios.get(`${URL}/${id}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestUpdateTeam = async (teamID, team) => {
  try {
    const response = await axios.put(`${URL}/${teamID}`, team, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestDeleteTeam = async (teamID) => {
  try {
    const response = await axios.delete(`${URL}/${teamID}`, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};

export const requestAddTeam = async (team) => {
  try {
    const response = await axios.post(`${URL}`, team, {
      headers: authHeader(),
    });
    return response.data.data;
  } catch (error) {
    return;
  }
};
