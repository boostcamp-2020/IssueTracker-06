import axios from '@lib/axios';
import { IssueWithoutId, Issue } from '@stores/type';
import { AddIssueRequest } from '@stores/issue/addIssue';

export type CreateIssue = IssueWithoutId;

const createIssue = async ({ issue }: AddIssueRequest): Promise<any> => {
  try {
    const response = await axios.post('/issue', issue);
    const createdIssue: Issue = {
      id: response.data,
      ...issue,
    };
    return createdIssue;
  } catch (error) {
    console.error(error);
  }
};

export default createIssue;
