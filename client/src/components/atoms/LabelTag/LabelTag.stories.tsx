import React from 'react';
import { text, color } from '@storybook/addon-knobs';
import LabelTag from './LabelTag';

export default {
  title: 'Atoms/LabelTag',
  component: LabelTag,
};

export const Default = () => {
  const value = text('tag text', 'Bug');
  const bgColor = color('background color', 'rgba(163,10,10,100)');
  const hexColor = bgColor
    .slice(5, -1)
    .split(',')
    .map((v) => Number(v).toString(16).padStart(2, '0'))
    .join('')
    .slice(0, 6);

  return <LabelTag id={0} name={value} color={`#${hexColor}`} />;
};
