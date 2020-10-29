import Issue from '@models/issue';

const updateIssueMilestone = async (issueId: number, milestoneId: number) => {
  try {
    await Issue.update({ milestone_id: milestoneId }, { where: { id: issueId } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueMilestone;
