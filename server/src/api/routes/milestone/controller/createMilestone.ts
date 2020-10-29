import { Request, Response, NextFunction } from 'express';
import milestoneService from '@service/milestone';

const createMilestone = async (req: Request, res: Response, next: NextFunction) => {
  const { name, date, description } = req.body;
  const milestoneId = await milestoneService.createMilestone({ name, date, description });
  if (!milestoneId) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, milestoneId });
};

export default createMilestone;
