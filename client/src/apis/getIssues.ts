import axios from '@lib/axios';
import { Issue } from '@stores/type';

interface Response {
  result: boolean;
  issues: Issue[];
}

const getIssues = async (): Promise<Issue[] | undefined> => {
  try {
    const { data } = await axios.get<Response>('/issues');
    if (data.result && data.issues) {
      return data.issues;
    }
    return undefined;
  } catch (error) {
    console.error(error);
  }
};

export default getIssues;
