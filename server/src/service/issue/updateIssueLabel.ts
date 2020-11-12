import Issue from '@models/issue';
import Label from '@models/label';

interface IssueInstance extends Issue {
  addLabel: (ids: number[]) => Promise<void>;
  removeLabel: (ids: number[]) => Promise<void>;
  Labels: Label[];
}

const updateIssueLabel = async (issueId: number, newLabels: number[]) => {
  try {
    const issueToUpdate = (await Issue.findOne({
      where: { id: issueId },
      include: [
        {
          model: Label,
          attributes: ['id'],
        },
      ],
    })) as IssueInstance;

    const currentLabels = issueToUpdate.Labels.map((label) => label.id);

    const labelsToAdd = newLabels.filter((label) => !currentLabels.includes(label));
    const labelsToDestroy = currentLabels.filter((label) => !newLabels.includes(label));

    await issueToUpdate.addLabel(labelsToAdd);
    await issueToUpdate.removeLabel(labelsToDestroy);

    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueLabel;
