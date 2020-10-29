import { Request, Response, NextFunction } from 'express';
import milestoneService from '@service/milestone';

const getMilestones = async (req: Request, res: Response, next: NextFunction) => {
  const milestones = await milestoneService.getMilestones();
  if (!milestones) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, milestones });
};

export default getMilestones;
