import React from 'react';
import { text } from '@storybook/addon-knobs';
import BoldText from '.';

export default {
  title: 'Atoms/BoldText',
  component: BoldText,
};

export const Default = () => {
  const value = text('text', 'default');

  return <BoldText value={value} />;
};
