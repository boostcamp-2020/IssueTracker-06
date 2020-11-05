import React from 'react';
import { text } from '@storybook/addon-knobs';
import FilterItemLabel from './FilterItemLabel';

export default {
  title: 'Molecules/FilterItemLabel',
  component: FilterItemLabel,
};

export const Default = () => {
  const swatchColor = text('swatch color', '#eee');
  const title = text('title', 'bug');
  const description = text('description', "Something isn't working");

  return (
    <FilterItemLabel
      swatchColor={swatchColor}
      title={title}
      description={description}
    />
  );
};
