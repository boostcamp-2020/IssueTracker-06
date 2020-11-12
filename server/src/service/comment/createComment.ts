import Comment from '@models/comment';

interface CommentProps {
  content: string;
  userId: number;
  issueId: number;
}

const createIssue = async (comment: CommentProps) => {
  const { content, userId, issueId } = comment;

  try {
    const createdComment = await Comment.create({
      content,
      user_id: userId,
      issue_id: issueId,
    });
    return createdComment.id;
  } catch (error) {
    console.error(error);
  }
};

export default createIssue;
