import { Request, Response, NextFunction } from 'express';
import commentService from '@service/comment';

// 추후 user service에 TOKEN 추가하여 수정 예정
const DUMMY_USER_ID = 1;

const createComment = async (req: Request, res: Response, next: NextFunction) => {
  const userId = DUMMY_USER_ID;
  const { content, issueId } = req.body;
  const commentId = await commentService.createComment({
    content,
    userId,
    issueId,
  });
  if (!commentId) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, commentId });
};

export default createComment;
