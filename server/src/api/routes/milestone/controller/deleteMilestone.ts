import { Request, Response, NextFunction } from 'express';
import milestoneService from '@service/milestone';

const deleteMilestone = async (req: Request, res: Response, next: NextFunction) => {
  const milestoneId = Number(req.params.id);
  const deleteResult = await milestoneService.deleteMilestone(milestoneId);
  if (!deleteResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default deleteMilestone;
