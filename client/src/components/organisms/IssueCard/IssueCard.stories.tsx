import React from 'react';
import { text, number, boolean } from '@storybook/addon-knobs';
import IssueCard from './IssueCard';

export default {
  title: 'Organisms/IssueCard',
  component: IssueCard,
};

export const Default = () => {
  const isOpen = boolean('is open', true);
  const title = text('title', 'Cannot fix this issue');
  const label = text('label', 'enhancement');
  const labelBg = text('label background', '#a2eeef');
  const issueNum = number('issue number', 100);
  const time = text('time', '3 days ago');
  const author = text('author', 'user1');
  const milestone = text('milestone', 'component UI');
  const assignees = [
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
  return (
    <IssueCard
      isOpen={isOpen}
      title={title}
      label={label}
      labelBg={labelBg}
      issueNum={issueNum}
      time={time}
      author={author}
      milestone={milestone}
      assignees={assignees}
    />
  );
};
