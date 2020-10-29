import { Request, Response, NextFunction } from 'express';
import commentService from '@service/comment';

const updateComment = (req: Request, res: Response, next: NextFunction) => {
  const id = Number(req.params.id);
  const { content } = req.body;
  const updateResult = commentService.updateComment({ id, content });
  if (!updateResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateComment;
