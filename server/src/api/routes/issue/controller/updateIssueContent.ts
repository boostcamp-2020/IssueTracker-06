import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

const updateIssueContent = async (req: Request, res: Response, next: NextFunction) => {
  const issueId = Number(req.params.id);
  const issueContent = req.body.content;
  const updateResult = await issueService.updateIssueContent(issueId, issueContent);
  if (!updateResult) {
    res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateIssueContent;
