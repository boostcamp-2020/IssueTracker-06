import React from 'react';
import { text } from '@storybook/addon-knobs';
import BoldText from '@components/atoms/BoldText';
import List from '.';

export default {
  title: 'Atoms/List',
  component: List,
};

export const Default = () => {
  const content = <BoldText value="리스트" />;

  return <List content={content} />;
};
