import React from 'react';
import { text } from '@storybook/addon-knobs';
import LabelTag from './LabelTag';

export default {
  title: 'Atoms/LabelTag',
  component: LabelTag,
};

export const Default = () => {
  const value = text('tag text', 'Bug');
  const bgColor = text('background color', '#a30a0a');

  return <LabelTag text={value} bgColor={bgColor} />;
};
