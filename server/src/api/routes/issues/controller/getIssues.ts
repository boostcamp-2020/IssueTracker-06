import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

// 추후 user service에 TOKEN 추가하여 수정 예정
const DUMMY_USER_ID = 1;

const getIssues = async (req: Request, res: Response, next: NextFunction) => {
  const userId = DUMMY_USER_ID;
  const { author, assignee, milestone, label, comment } = req.query;

  const issues = await issueService.getIssues({
    author: author && String(author),
    assignee: assignee && String(assignee),
    milestone: milestone && String(milestone),
    label: label && String(label),
    comment: Boolean(comment),
    userId,
  });

  if (!issues) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, issues });
};

export default getIssues;
