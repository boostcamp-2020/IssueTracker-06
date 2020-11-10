import React from 'react';

import useChange from '@hooks/useChange';

import DatePickerInput from './DatePickerInput';

export default {
  title: 'Atoms/DatePickerInput',
  component: DatePickerInput,
};

export const Default = () => {
  const [date, , onChangeDate] = useChange<HTMLInputElement>('');

  return <DatePickerInput value={date} onChange={onChangeDate} />;
};
