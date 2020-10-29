import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

const updateIssueStatus = async (req: Request, res: Response, next: NextFunction) => {
  const issueId = Number(req.params.id);
  const { isOpen } = req.body;
  const updateResult = await issueService.updateIssueStatus({ id: issueId, isOpen });
  if (!updateResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateIssueStatus;
