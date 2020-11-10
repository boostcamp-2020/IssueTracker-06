import React from 'react';
import { text, color } from '@storybook/addon-knobs';
import { action } from '@storybook/addon-actions';
import SelectMenuItemLabel from '@/components/molecules/SelectMenuModal/SelectMenuItem/SelectMenuItemLabel';
import SelectMenuItem from './SelectMenuItem';

export default {
  component: SelectMenuItem,
  title: 'Molecules/SelectMenuItem',
};
export const Default = () => {
  const title = text('content', '1');
  const pickedColor = color('color', '#eee');

  return (
    <SelectMenuItem onClick={action('click')}>
      <SelectMenuItemLabel swatchColor={pickedColor} title={title} />
    </SelectMenuItem>
  );
};
