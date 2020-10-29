import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

const getIssue = async (req: Request, res: Response, next: NextFunction) => {
  const issueId = Number(req.params.id);
  const issue = await issueService.getIssue(issueId);

  if (!issue) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, issue });
};

export default getIssue;
