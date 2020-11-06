import { Request, Response, NextFunction } from 'express';
import labelService from '@service/label';

const getLabels = async (req: Request, res: Response, next: NextFunction) => {
  const labels = await labelService.getLabels();
  if (!labels) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, labels });
};

export default getLabels;
