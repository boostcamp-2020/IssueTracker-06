import { IssueWithoutId } from '@stores/type';

const convertIssue = (issue: IssueWithoutId): Issue => {
  const milestoneId = issue.Milestone?.id;
  const labelIds = issue.Labels.map((label) => label.id);
  const assigneeIds = issue.Assignee.map((assignee) => assignee.id);
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
