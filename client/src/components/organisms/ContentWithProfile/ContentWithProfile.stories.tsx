import React from 'react';
import { text } from '@storybook/addon-knobs';
import ContentWithProfile from '.';

export default {
  title: 'Organisms/ContentWithProfile',
  component: ContentWithProfile,
};

const PROFILE_URL =
  'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4';

export const Default = () => {
  const name = text('name', '16010948');
  const content = text('content', '안녕하세용~~~');

  return (
    <ContentWithProfile profile={PROFILE_URL} name={name} content={content} />
  );
};
