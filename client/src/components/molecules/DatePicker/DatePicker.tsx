import React, { FunctionComponent, ChangeEvent } from 'react';
import DatePickerInput from '@/components/atoms/DatePickerInput';
import InputLabel from '@components/atoms/InputLabel';

const onChange = (e: ChangeEvent<HTMLInputElement>) => {};

const DatePicker: FunctionComponent = () => (
  <div>
    <InputLabel text="Due date (optional)" />
    <DatePickerInput onChange={onChange} />
  </div>
);

export default DatePicker;
