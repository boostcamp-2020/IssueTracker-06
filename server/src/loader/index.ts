import { Express } from 'express';
import expressLoader from './express';
import { sequelize } from '../models'

const loader = async (app: Express) => {
  expressLoader(app);
  await sequelize.sync({ force: false })
};
export default loader;
