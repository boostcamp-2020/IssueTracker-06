import { Request, Response, NextFunction } from 'express';
import labelService from '@service/label';

const updateLabel = async (req: Request, res: Response, next: NextFunction) => {
  const labelId = Number(req.params.id);
  const { name, description, color } = req.body;

  const updateResult = await labelService.updateLabel({ id: labelId, name, description, color });

  if (!updateResult) {
    return res.status(400).json({ result: false });
  }
  res.json({ result: true });
};

export default updateLabel;
