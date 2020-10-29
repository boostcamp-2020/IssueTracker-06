import { Request, Response, NextFunction } from 'express';
import labelService from '@service/label';

const createLabel = async (req: Request, res: Response, next: NextFunction) => {
  const { name, description, color } = req.body;
  const labelId = await labelService.createLabel({ name, description, color });
  if (!labelId) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true, labelId });
};

export default createLabel;
