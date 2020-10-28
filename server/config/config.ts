import dotenv  from'dotenv'

dotenv.config();

const { DB_NAME, DB_HOST, DB_PASSWORD, DB_USERNAME } = process.env;

export default {
  development: {
    username: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_NAME,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: false,
  },
  test: {
    username: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_NAME,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: false,
  },
  production: {
    username: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_NAME,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: false,
  },
};
