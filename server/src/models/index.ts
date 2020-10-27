import User, { associate as associateUser } from './user';
import Comment, { associate as associateComment } from './comment';
import Issue, { associate as associateIssue } from './issue';

export * from './sequelize';

const db = { User, Comment, Issue};

export type dbType = typeof db;

associateUser(db);
associateComment(db);
associateIssue(db);
