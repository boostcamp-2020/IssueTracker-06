import { Request, Response, NextFunction } from 'express';
import labelService from '@service/label';

const deleteLabel = async (req: Request, res: Response, next: NextFunction) => {
  const { labelId } = req.body;
  const deleteResult = await labelService.deleteLabel(labelId);

  if (!deleteResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default deleteLabel;
