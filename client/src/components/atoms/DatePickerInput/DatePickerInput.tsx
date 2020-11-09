import React, { FunctionComponent, ChangeEvent } from 'react';
import styled from '@themes/styled';

const StyledDatePicker = styled.input`
  ${({ theme }) => theme.commonStyle.input};
  width: 100%;
  font-size: 0.8rem;
  padding: 5px 12px;
`;

interface Props {
  value?: string;
  onChange: (e: ChangeEvent<HTMLInputElement>) => void;
}

const DatePicker: FunctionComponent<Props> = ({ value, onChange }) => (
  <StyledDatePicker type="date" value={value} onChange={onChange} />
);

export default DatePicker;
