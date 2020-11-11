import Issue from '@models/issue';

interface UpdatedIssueStatus {
  id: number;
  isOpen: boolean;
}

const updateIssueStatus = async (comment: UpdatedIssueStatus) => {
  const { id, isOpen } = comment;
  try {
    await Issue.update({ is_open: isOpen }, { where: { id } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateIssueStatus;
