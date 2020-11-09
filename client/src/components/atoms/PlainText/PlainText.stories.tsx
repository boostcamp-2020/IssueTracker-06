import React from 'react';
import { text } from '@storybook/addon-knobs';
import PlainText from '.';

export default {
  title: 'Atoms/PlainText',
  component: PlainText,
};

export const Default = () => {
  const value = text('text', 'default');

  return <PlainText value={value} />;
};
