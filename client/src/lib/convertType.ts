import { User, Comment, Milestone, Label } from '@stores/type';

interface Issue {
  title: string;
  content: string;
  milestoneId?: number;
  labelIds?: number[];
  assigneeIds?: number[];
}

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

const convertIssue = (issue: CreateIssue): Issue => {
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

export default convertIssue;
