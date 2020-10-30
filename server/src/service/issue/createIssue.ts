import Issue from '@models/issue';

interface IssueProps {
  title: string;
  content?: string;
  milestoneId?: number;
  labelIds?: number[];
  assigneeIds?: number[];
  userId: number;
}

interface IssueInstance extends Issue {
  addLabels: (ids: number[]) => Promise<void>;
  addAssignee: (ids: number[]) => Promise<void>;
}

const createIssue = async (issue: IssueProps) => {
  const { title, content, milestoneId, labelIds, assigneeIds, userId } = issue;

  try {
    const createdIssue = (await Issue.create({
      title,
      content,
      milestone_id: milestoneId,
      user_id: userId,
      is_open: true,
    })) as IssueInstance;

    if (labelIds) {
      await createdIssue.addLabels(labelIds);
    }
    if (assigneeIds) {
      await createdIssue.addAssignee(assigneeIds);
    }

    return createdIssue.id;
  } catch (error) {
    console.error(error);
  }
};

export default createIssue;
