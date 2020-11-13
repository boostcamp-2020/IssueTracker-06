import React, { FunctionComponent } from 'react';
import DatePickerInput from '@components/atoms/DatePickerInput';
import InputLabel from '@components/atoms/InputLabel';

interface Props {
  value: string;
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

const DatePicker: FunctionComponent<Props> = ({ value, onChange }) => (
  <div>
    <InputLabel text="Due date (optional)" />
    <DatePickerInput value={value} onChange={onChange} />
  </div>
);

export default DatePicker;
