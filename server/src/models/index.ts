import Labels, { associate as associateLabels } from './labels';
import Milestones, { associate as associateMilestones } from './milestones';

export * from './sequelize';

const db = {
  Labels,
  Milestones,
};

associateLabels(db);
associateMilestones(db);

export type dbType = typeof db;
