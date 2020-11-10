import React from 'react';
import { text } from '@storybook/addon-knobs';
import { action } from '@storybook/addon-actions';
import FilterButton from './FilterButton';

export default {
  title: 'Atoms/FilterButton',
  component: FilterButton,
};

export const Default = () => {
  const value = text('button text', 'Author');

  return <FilterButton onClick={action('click')} text={value} />;
};
