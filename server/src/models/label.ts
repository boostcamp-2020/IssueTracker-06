import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Label extends Model {
  public readonly id!: number;

  public name!: string;

  public color!: string;

  public description?: string;
}

Label.init(
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
    modelName: 'Label',
    tableName: 'labels',
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
);

export const associate = (db: dbType) => {
  db.Label.belongsToMany(db.Issue, { through: 'issue_label', foreignKey: 'label_id' });
};
export default Label;
