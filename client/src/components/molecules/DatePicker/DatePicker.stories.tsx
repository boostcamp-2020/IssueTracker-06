import React from 'react';
import DatePicker from './DatePicker';

import useChange from '@hooks/useChange';

export default {
  title: 'Molecules/DatePicker',
  component: DatePicker,
};

export const Default = () => {
  const [value, , onChangeValue] = useChange<HTMLInputElement>('');

  return <DatePicker value={value} onChange={onChangeValue} />;
};
