import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

const updateIssueTitle = async (req: Request, res: Response, next: NextFunction) => {
  const issueId = Number(req.params.id);
  const issueTitle = req.body.title;
  const updateResult = await issueService.updateIssueTitle(issueId, issueTitle);
  if (!updateResult) {
    res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateIssueTitle;
