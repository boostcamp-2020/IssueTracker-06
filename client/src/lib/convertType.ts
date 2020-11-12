import { User, Comment, Milestone, Label, Issue } from '@stores/type';

// interface Issue {
//   title: string;
//   content: string;
//   milestoneId?: number;
//   labelIds?: number[];
//   assigneeIds?: number[];
// }

interface CreateIssue {
  title: string;
  content: string;
  isOpen: boolean;
  user: User;
  assignees: User[];
  comments: Comment[];
  milestone: Milestone | null;
  labels: Label[];
}

const convertIssue = (issue: CreateIssue):any => {
  const milestoneId = issue.milestone?.id;
  const labelIds = issue.labels.map((label) => label.id);
  const assigneeIds = issue.assignees.map((assignee) => assignee.id);
  const newTypeIssue = {
    title: issue.title,
    content: issue.content,
    milestoneId,
    labelIds,
    assigneeIds,
  };
  return newTypeIssue;
};

export const convertSelectedIssue = (issue: any): Issue => {
  const { id, title, content } = issue;

  const newTypeIssue = {
    id,
    title,
    content,
    labels: issue.Labels,
    assignees: issue.Assignee,
    comments: issue.Comments,
    milestone: issue.Milestone,
    user: issue.User,
    isOpen: issue.is_open,
  };
  return newTypeIssue;
};

export default convertIssue;
