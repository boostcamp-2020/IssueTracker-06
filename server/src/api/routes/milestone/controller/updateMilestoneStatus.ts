import { Request, Response, NextFunction } from 'express';
import milestoneService from '@service/milestone';

const updateMilestoneStatus = async (req: Request, res: Response, next: NextFunction) => {
  const milestoneId = Number(req.params.id);
  const { isOpen } = req.body;

  const updatedMilestoneStatus = await milestoneService.updateMilestoneStatus({
    id: milestoneId,
    isOpen,
  });

  if (!updatedMilestoneStatus) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateMilestoneStatus;
