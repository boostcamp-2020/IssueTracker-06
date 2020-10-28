import express, { Express } from 'express';
import logger from 'morgan';
import helmet from 'helmet';
import hpp from 'hpp';
import cors from 'cors';
import compression from 'compression';

const prod = process.env.NODE_ENV === 'production';

const expressLoader = (app: Express) => {
  if (prod) {
    app.use(logger('combined'));
    app.use(helmet());
    app.use(hpp());
  } else {
    app.use(logger('dev'));
  }
  app.use(
    cors({
      origin: true,
      credentials: true,
    }),
  );
  app.use(compression());
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
};

export default expressLoader;
