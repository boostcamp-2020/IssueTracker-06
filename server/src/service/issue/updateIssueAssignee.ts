import Issue from '@models/issue';
import User from '@models/user';

interface IssueInstance extends Issue {
  addAssignee: (ids: number[]) => Promise<void>;
  removeAssignee: (ids: number[]) => Promise<void>;
  Assignee: User[];
}

const updateIssueAssignee = async (issueId: number, newAssignees: number[]) => {
  try {
    const issueToUpdate = (await Issue.findOne({
      where: { id: issueId },
      include: [
        {
          model: User,
          attributes: ['id'],
          as: 'Assignee',
        },
      ],
    })) as IssueInstance;
    const currentAssignees = issueToUpdate.Assignee.map((user) => user.id);

    const assigneesToAdd = newAssignees.filter((assignee) => !currentAssignees.includes(assignee));
    const assigneesToDestroy = currentAssignees.filter(
      (assignee) => !newAssignees.includes(assignee),
    );

    await issueToUpdate.addAssignee(assigneesToAdd);
    await issueToUpdate.removeAssignee(assigneesToDestroy);
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueAssignee;
