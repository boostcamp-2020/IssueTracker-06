/* eslint-disable camelcase */
import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class User extends Model {
  public readonly id!: number;

  public email!: string;

  public password!: string;

  public name!: string;

  public profile?: string;
}

User.init(
  {
    email: {
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

export const associate = (db: dbType) => {
  db.User.belongsToMany(db.Issue, { through: 'issue_assigned', foreignKey: 'assigned_id' });
  db.User.hasMany(db.Issue, { foreignKey: 'user_id' });
  db.User.hasMany(db.Comment, { foreignKey: 'user_id' });
};

export default User;
