import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Labels extends Model {
  public readonly id!: number;

  public name!: string;

  public color!: string;

  public description?: string;
}

Labels.init(
  {
    name: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    color: {
      type: DataTypes.STRING(10),
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING(250),
      allowNull: true,
    },
  },
  {
    sequelize,
    modelName: 'Labels',
    tableName: 'labels',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {};
export default Labels;
