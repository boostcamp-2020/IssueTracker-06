import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Issue extends Model {
  public readonly id!: number;

  public issue_number!: number;

  public title!: string;

  public content!: string;

  public is_open!: boolean;
}

Issue.init(
  {
    issue_number: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    title: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    is_open: {
      type: DataTypes.TINYINT,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'Issue',
    tableName: 'issues',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {};

export default Issue;