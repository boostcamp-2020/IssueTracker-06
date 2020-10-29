/* eslint-disable camelcase */
import { Model, DataTypes } from 'sequelize';
import { sequelize } from './sequelize';
import { dbType } from './index';

class Issue extends Model {
  public readonly id!: number;

  public title!: string;

  public content!: string;

  public is_open!: boolean;
}

Issue.init(
  {
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

export const associate = (db: dbType) => {
  db.Issue.belongsToMany(db.User, {
    through: 'issue_assigned',
    foreignKey: 'issue_id',
    as: 'Assignee',
  });
  db.Issue.belongsTo(db.User, { foreignKey: 'user_id' });
  db.Issue.belongsToMany(db.Labels, { through: 'issue_label', foreignKey: 'issue_id' });
  db.Issue.belongsTo(db.Milestones, { foreignKey: 'milestone_id' });
  db.Issue.hasMany(db.Comment, { foreignKey: 'issue_id' });
};

export default Issue;
