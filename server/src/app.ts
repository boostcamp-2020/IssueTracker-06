import express from 'express';
import loader from './loader';

const app = express();
const PORT = process.env.PORT || 4000;

const onListening = () => console.log(`Listening on port ${PORT}`);

const startServer = async () => {
  await loader(app);
  app.listen(PORT, onListening);
};

startServer();
