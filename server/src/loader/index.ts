import { Express } from 'express';
import expressLoader from './express';

const loader = (app: Express) => {
  expressLoader(app);
};
export default loader;
