import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class User extends Model {
  public readonly id!: number;

  public user_id!: string;

  public password!: string;

  public name!: string;

  public profile?: string;
}

User.init(
  {
    user_id: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(250),
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    profile: {
      type: DataTypes.STRING(250),
      allowNull: true,
    },
  },
  {
    sequelize,
    modelName: 'User',
    tableName: 'users',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {};

export default User;