import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

// 추후 user service에 TOKEN 추가하여 수정 예정
const DUMMY_USER_ID = 1;

const createIssue = async (req: Request, res: Response, next: NextFunction) => {
  const userId = DUMMY_USER_ID;
  const { title, content, milestoneId, labelIds, assigneeIds } = req.body;
  const issueId = await issueService.createIssue({
    title,
    content,
    milestoneId,
    labelIds,
    assigneeIds,
    userId,
  });
  if (!issueId) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, issueId });
};

export default createIssue;
