import React, { ChangeEvent, useState } from 'react';
import DatePickerInput from './DatePickerInput';

export default {
  title: 'Atoms/DatePickerInput',
  component: DatePickerInput,
};

export const Default = () => {
  const [date, setDate] = useState('');

  const onChange = (e: ChangeEvent<HTMLInputElement>) => {
    setDate(e.target.value);
  };

  return <DatePickerInput value={date} onChange={onChange} />;
};
