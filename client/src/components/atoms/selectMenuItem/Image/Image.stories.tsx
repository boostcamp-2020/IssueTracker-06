import React from 'react';
import { text } from '@storybook/addon-knobs';
import Img from './Image';

export default {
  title: 'Atoms/Image',
  component: Img,
};

export const Default = () => {
  const src = text(
    'src',
    'https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4',
  );
  const alt = text('alt', 'user1');

  return <Img src={src} alt={alt} />;
};
