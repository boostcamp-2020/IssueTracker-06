import React from 'react';
import { text } from '@storybook/addon-knobs';
import FilterButton from './FilterButton';

export default {
  title: 'Components/FilterButton',
  component: FilterButton,
};

export const Default = () => {
  const onClick = () => {};
  const value = text('button text', 'Author');

  return <FilterButton onClick={onClick} text={value} />;
};
