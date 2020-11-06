import Issue from '@models/issue';

const updateIssueContent = async (issueId: number, issueContent: string) => {
  try {
    await Issue.update({ content: issueContent }, { where: { id: issueId } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueContent;
