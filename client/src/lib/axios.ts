import axios from 'axios';

const baseAxios = axios.create({
  baseURL: `${process.env.API_URL}/api`,
  withCredentials: true,
});

export default baseAxios;
