/* eslint-disable consistent-return */
import axios from '@lib/axios';

const readMilestones = async (): Promise<any> => {
  try {
    const { data } = await axios.get('/milestones');
    return data.milestones;
  } catch (error) {
    console.error(error);
  }
};

export default readMilestones;
