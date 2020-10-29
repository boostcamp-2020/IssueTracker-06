import { Request, Response, NextFunction } from 'express';
import issueService from '@service/issue';

const updateIssue = async (req: Request, res: Response, next: NextFunction) => {
  const issueId = Number(req.params.id);
  const { target } = req.params;
  const { targets } = req.body;
  let updateResult;
  if (target === 'assignee') {
    updateResult = await issueService.updateIssueAssignee(issueId, targets);
  }
  if (target === 'label') {
    updateResult = await issueService.updateIssueLabel(issueId, targets);
  }
  if (target === 'milestone') {
    const milestoneId = targets[0];
    updateResult = issueService.updateIssueMilestone(issueId, milestoneId);
  }

  if (!updateResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateIssue;
