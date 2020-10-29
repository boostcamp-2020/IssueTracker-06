import { Request, Response, NextFunction } from 'express';
import milestoneService from '@service/milestone';

const updateMilestone = async (req: Request, res: Response, next: NextFunction) => {
  const milestoneId = Number(req.params.id);
  const { name, date, description } = req.body;

  const updatedMilestone = await milestoneService.updateMilestone({
    id: milestoneId,
    name,
    date,
    description,
  });

  if (!updatedMilestone) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateMilestone;
