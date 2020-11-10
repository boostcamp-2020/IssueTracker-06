import axios from 'axios';

const { API_URL } = process.env;

const baseAxios = axios.create({
  baseURL: `${API_URL}/api`,
  withCredentials: true,
});

export default baseAxios;
