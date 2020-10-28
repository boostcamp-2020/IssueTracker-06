/* eslint-disable camelcase */
import { Model, DataTypes, Sequelize } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Comment extends Model {
  public readonly id!: number;

  public content!: string;

  public readonly created_at!: Date;

  public readonly updated_at!: Date;
}

Comment.init(
  {
    content: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at',
    },
    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at',
    },
  },
  {
    sequelize,
    modelName: 'Comment',
    tableName: 'comments',
    charset: 'utf8',
    collate: 'utf8_general_ci',
    timestamps: true,
  },
);

export const associate = (db: dbType) => {
  db.Comment.belongsTo(db.Issue, { foreignKey: 'issue_id' });
  db.Comment.belongsTo(db.User, { foreignKey: 'user_id' });
};

export default Comment;
