import Comment, { associate as associateComment } from './comment';

export * from './sequelize';

const db = {Comment};

export type dbType = typeof db;

associateComment(db);