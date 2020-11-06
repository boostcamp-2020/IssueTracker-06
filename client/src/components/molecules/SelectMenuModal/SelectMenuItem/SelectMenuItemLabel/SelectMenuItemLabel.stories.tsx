import React from 'react';
import { color, text } from '@storybook/addon-knobs';
import SelectMenuItemLabel from './SelectMenuItemLabel';

export default {
  title: 'Molecules/SelectMenuItemLabel',
  component: SelectMenuItemLabel,
};

export const Default = () => {
  const swatchColor = color('swatch color', '#eee');
  const title = text('title', 'bug');
  const description = text('description', "Something isn't working");
  const onClick = () => {};

  return (
    <SelectMenuItemLabel
      swatchColor={swatchColor}
      title={title}
      description={description}
      onClick={onClick}
    />
  );
};
