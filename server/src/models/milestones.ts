import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Milestones extends Model {
  public readonly id!: number;

  public name!: string;

  public date?: Date;

  public description?: string;

  public is_open!: Boolean;
}

Milestones.init(
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
    modelName: 'Milestones',
    tableName: 'milestones',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {};
export default Milestones;
