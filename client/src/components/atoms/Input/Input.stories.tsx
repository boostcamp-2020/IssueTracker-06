import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import Input from './Input';

export default {
  component: Input,
  title: 'Input',
};
export const Default = () => {
  const [value, setValue] = useState('');
  const placeholder = text('placeholder', 'Title');
  const onChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setValue(e.target.value);
  };
  const type = text('type', 'text');
  return (
    <Input
      value={value}
      placeholder={placeholder}
      onChange={onChange}
      type={type}
    />
  );
};
