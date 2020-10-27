import { Model, DataTypes } from 'sequelize';
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
    },
    {
      sequelize,
      modelName: 'Comment',
      tableName: 'comments',
      charset: 'utf8',
      collate: 'utf8_general_ci',
    },
  );
  
  export const associate = (db: dbType) => {};
  
  export default Comment;