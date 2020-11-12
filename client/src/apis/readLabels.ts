/* eslint-disable consistent-return */
import axios from '@lib/axios';

const readLabels = async (): Promise<any> => {
  try {
    const { data } = await axios.get('/labels');
    return data.labels;
  } catch (error) {
    console.error(error);
  }
};

export default readLabels;
