import React from 'react';
import { text } from '@storybook/addon-knobs';
import SelectMenuItemUser from './SelectMenuItemUser';

export default {
  title: 'Molecules/SelectMenuItemUser',
  component: SelectMenuItemUser,
};

export const Default = () => {
  const title = text('username', 'user1');
  const userImgSrc =
    'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4';

  return <SelectMenuItemUser title={title} userImgSrc={userImgSrc} />;
};
