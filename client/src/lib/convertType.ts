import { IssueWithoutId } from '@stores/type';

interface Issue {
  title: string;
  content: string;
  milestoneId?: number;
  labelIds?: number[];
  assigneeIds?: number[];
}

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

export default convertIssue;
