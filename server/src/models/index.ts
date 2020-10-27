import User, { associate as associateUser } from './user';
import Comment, { associate as associateComment } from './comment';
import Issue, { associate as associateIssue } from './issue';
import Labels, { associate as associateLabels } from './labels';
import Milestones, { associate as associateMilestones } from './milestones';

export * from './sequelize';

const db = { User, Comment, Issue, Labels, Milestones};

export type dbType = typeof db;

associateUser(db);
associateComment(db);
associateIssue(db);
associateLabels(db);
associateMilestones(db);
