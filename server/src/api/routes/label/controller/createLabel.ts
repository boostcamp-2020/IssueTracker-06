import { Request, Response, NextFunction } from 'express';
import labelService from '@service/label';

const createLabel = async (req: Request, res: Response, next: NextFunction) => {
  const label = req.body;
  const labelId = await labelService.createLabel(label);
  if (!labelId) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, labelId });
};

export default createLabel;
