import axios from '@lib/axios';
import convertIssue from '@lib/convertType';
import { Issue, User, Comment, Milestone, Label } from '@stores/type';
import { AddIssueRequest } from '@stores/issue/addIssue';

export interface CreateIssue {
  title: string;
  content: string;
  isOpen: boolean;
  user: User;
  assignees: User[];
  comments: Comment[];
  milestone: Milestone | null;
  labels: Label[];
}

const createIssue = async ({ issue }: AddIssueRequest): Promise<any> => {
  try {
    const newIssue = convertIssue(issue);
    const response = await axios.post('/issue', newIssue);
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
