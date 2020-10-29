import User, { associate as associateUser } from './user';
import Comment, { associate as associateComment } from './comment';
import Issue, { associate as associateIssue } from './issue';
import Label, { associate as associateLabel } from './label';
import Milestone, { associate as associateMilestone } from './milestone';

export * from './sequelize';

const db = { User, Comment, Issue, Label, Milestone };

export type dbType = typeof db;

associateUser(db);
associateComment(db);
associateIssue(db);
associateLabel(db);
associateMilestone(db);
