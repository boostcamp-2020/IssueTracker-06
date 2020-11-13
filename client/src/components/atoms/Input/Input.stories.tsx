import React from 'react';
import { text } from '@storybook/addon-knobs';

import useChange from '@hooks/useChange';

import Input from './Input';

export default {
  component: Input,
  title: 'Atoms/Input',
};
export const Default = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');
  const placeholder = text('placeholder', 'Title');
  const type = text('type', 'text');

  return (
    <Input
      value={value}
      placeholder={placeholder}
      onChange={onChangeValue}
      type={type}
    />
  );
};
