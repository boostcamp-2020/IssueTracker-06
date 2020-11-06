import Issue from '@models/issue';

const updateIssueTitle = async (issueId: number, issueTitle: string) => {
  try {
    await Issue.update({ title: issueTitle }, { where: { id: issueId } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueTitle;
