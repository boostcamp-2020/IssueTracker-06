import { Milestone, User, Comment, Label } from './type';

export const ADD_ISSUE = 'ADD_ISSUE';

interface CreateIssue {
  title: string;
  content: string;
  isOpen: boolean;
  user: User;
  assignee: User[];
  comments: Comment[];
  milestone: Milestone;
  labels: Label[];
}

export interface AddIssueReturn {
  type: typeof ADD_ISSUE;
  issue: CreateIssue;
}

const addIssueAction = (newIssue: CreateIssue): AddIssueReturn => ({
  type: ADD_ISSUE,
  issue: newIssue,
});

export default addIssueAction;
