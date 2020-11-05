import React from 'react';
import { text, color } from '@storybook/addon-knobs';
import LabelTag from './LabelTag';

export default {
  title: 'Atoms/LabelTag',
  component: LabelTag,
};

export const Default = () => {
  const value = text('tag text', 'Bug');
  const bgColor = color('background color', '#a30a0a');

  return <LabelTag text={value} bgColor={bgColor} />;
};
