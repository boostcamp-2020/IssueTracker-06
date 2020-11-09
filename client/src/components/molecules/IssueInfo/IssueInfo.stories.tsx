import React from 'react';
import { text, number, boolean } from '@storybook/addon-knobs';
import IssueInfo from './IssueInfo';

export default {
  title: 'Molecules/IssueInfo',
  component: IssueInfo,
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
  return (
    <IssueInfo
      isOpen={isOpen}
      title={title}
      label={label}
      labelBg={labelBg}
      issueNum={issueNum}
      time={time}
      author={author}
      milestone={milestone}
    />
  );
};
