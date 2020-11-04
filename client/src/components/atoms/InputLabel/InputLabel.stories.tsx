import React from 'react';
import { text } from '@storybook/addon-knobs';
import InputLabel from './InputLabel';

export default {
  title: 'Components/InputLabel',
  component: InputLabel,
};

export const Default = () => {
  const value = text('label', 'Due date (optional)');
  return <InputLabel text={value} />;
};
