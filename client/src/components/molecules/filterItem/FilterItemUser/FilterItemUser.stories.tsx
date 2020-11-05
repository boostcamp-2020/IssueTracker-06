import React from 'react';
import { text } from '@storybook/addon-knobs';
import FilterItemUser from './FilterItemUser';

export default {
  title: 'Molecules/FilterItemUser',
  component: FilterItemUser,
};

export const Default = () => {
  const title = text('username', 'user1');
  const userImgSrc =
    'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4';
  const alt = 'user';

  return <FilterItemUser title={title} userImgSrc={userImgSrc} alt={alt} />;
};
