import { Sequelize, Options } from 'sequelize';
import config from '../../config/config';

const env = (process.env.NODE_ENV as 'production' | 'test' | 'development') || 'development';
const configEnv = config[env];
const { database, username, password } = configEnv;
const sequelize = new Sequelize(database!, username!, password, ({
  ...configEnv,
  define: { timestamps: false },
} as unknown) as Options);

export { sequelize };
export default sequelize;
