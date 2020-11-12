import React from 'react';
import { text } from '@storybook/addon-knobs';
import IssueContent from '.';

export default {
  title: 'Organisms/IssueContent',
  component: IssueContent,
};

export const Default = () => {
  const name = text('name', '16010948');
  const content = text('content', '안녕하세용~~~');

  return <IssueContent name={name} content={content} />;
};
