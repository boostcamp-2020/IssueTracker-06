import React from 'react';
import Assignees from './Assignees';

export default {
  title: 'Molecules/Assignees',
  component: Assignees,
};

export const Default = () => {
  const users = [
    {
      id: 0,
      name: 'user1',
      img: 'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4',
    },
    {
      id: 1,
      name: 'user2',
      img: 'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4',
    },
    {
      id: 2,
      name: 'user3',
      img: 'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4',
    },
  ];
  return <Assignees users={users} />;
};
