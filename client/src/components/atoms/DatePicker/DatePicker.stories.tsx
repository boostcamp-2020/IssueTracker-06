import React, { ChangeEvent, useState } from 'react';
import { text } from '@storybook/addon-knobs';
import DatePicker from './DatePicker';

export default {
  title: 'Components/DatePicker',
  component: DatePicker,
};

export const Default = () => {
  const value = text('date', '2020-11-04');
  const onChange = (e: ChangeEvent<HTMLInputElement>) => {};

  return <DatePicker value={value} onChange={onChange} />;
};
