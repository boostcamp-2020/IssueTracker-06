import axios from '@lib/axios';

const getIssue = async (issueId: number): Promise<any> => {
  try {
    const response = await axios.get(`/issue/${issueId}`);
    return response.data;
  } catch (error) {
    console.error(error);
  }
};

export default getIssue;
