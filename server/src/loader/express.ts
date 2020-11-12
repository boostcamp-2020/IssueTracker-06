import express, { Express } from 'express';
import logger from 'morgan';
import helmet from 'helmet';
import hpp from 'hpp';
import cors from 'cors';
import compression from 'compression';
import apiRouter from '@api/routes';
import path from 'path';
import ejs from 'ejs';

const prod = process.env.NODE_ENV === 'production';

const expressLoader = (app: Express) => {
  if (prod) {
    app.use(logger('combined'));
    app.use(helmet());
    app.use(hpp());
    app.set('views', path.join(__dirname, '..', '..', '..', 'client', 'dist'));
    app.use(express.static(path.join(__dirname, '..', '..', '..', 'client', 'dist')));
  } else {
    app.use(logger('dev'));
    app.set('views', path.join(__dirname, '..', '..', '..', 'client', 'public'));
    app.use(express.static(path.join(__dirname, '..', '..', '..', 'client', 'public')));
  }
  app.use(
    cors({
      origin: true,
      credentials: true,
    }),
  );
  app.set('view engine', 'ejs');
  app.engine('html', ejs.renderFile);
  app.use(compression());
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
  app.use('/api', apiRouter);
  app.get('/*', (req, res) => {
    res.render('index.html');
  });
};

export default expressLoader;
