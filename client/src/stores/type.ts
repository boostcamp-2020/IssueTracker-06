export interface Issue {
  id: number;
  title: string;
  content: string;
  isOpen: boolean;
  user: User;
  assignees: User[];
  comments: Comment[];
  milestone: Milestone | null;
  labels: Label[];
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
  createdAt?: string;
  updatedAt?: string;
  user: User;
}

export interface Milestone {
  id: number;
  name: string;
  date?: string;
  description: string;
  isOpen: boolean;
}

export interface Label {
  id: number;
  name: string;
  color: string;
  description?: string;
}
