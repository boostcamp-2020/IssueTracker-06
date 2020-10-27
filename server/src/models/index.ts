import User, { associate as associateUser } from './user';
import Issue, { associate as associateIssue } from './issue';

export * from './sequelize';

const db = { User, Issue };

export type dbType = typeof db;

associateUser(db);
associateIssue(db);