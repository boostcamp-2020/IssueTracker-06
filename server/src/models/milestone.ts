/* eslint-disable camelcase */
import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Milestone extends Model {
  public readonly id!: number;

  public name!: string;

  public date?: Date;

  public description?: string;

  public is_open!: Boolean;
}

Milestone.init(
  {
    name: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    date: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    description: {
      type: DataTypes.STRING(250),
      allowNull: true,
    },
    is_open: {
      type: DataTypes.TINYINT,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'Milestone',
    tableName: 'milestones',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {
  db.Milestone.hasMany(db.Issue, { foreignKey: 'milestone_id' });
};
export default Milestone;
