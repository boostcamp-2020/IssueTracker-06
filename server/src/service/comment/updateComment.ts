import Comment from '@models/comment';

interface CommentProps {
  id: number;
  content: string;
}

const updateComment = async (comment: CommentProps) => {
  const { id, content } = comment;
  try {
    await Comment.update({ content }, { where: { id } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateComment;
