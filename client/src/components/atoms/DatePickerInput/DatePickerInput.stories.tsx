import React, { ChangeEvent } from 'react';
import { text } from '@storybook/addon-knobs';
import DatePickerInput from './DatePickerInput';

export default {
  title: 'Atoms/DatePickerInput',
  component: DatePickerInput,
};

export const Default = () => {
  const value = text('date', '2020-11-04');
  const onChange = (e: ChangeEvent<HTMLInputElement>) => {};

  return <DatePickerInput value={value} onChange={onChange} />;
};
