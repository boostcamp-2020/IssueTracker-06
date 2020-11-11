/* eslint-disable camelcase */
export interface IssueWithoutId {
  title: string;
  content: string;
  is_open: boolean;
  User: User;
  Assignee: User[];
  Comments: Comment[];
  Milestone: Milestone | null;
  Labels: Label[];
}

export interface Issue extends IssueWithoutId {
  id: number;
}

export interface User {
  id: number;
  email: string;
  name: string;
  profile: string;
}

export interface Comment {
  id: number;
  content: string;
  created_at?: string;
  updated_at?: string;
  User: User;
}

export interface Milestone {
  id: number;
  name: string;
  date?: string;
  description: string;
  is_open: boolean;
}

export interface Label {
  id: number;
  name: string;
  color: string;
  description?: string;
}
