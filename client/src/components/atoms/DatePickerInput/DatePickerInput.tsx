import React, { FunctionComponent, ChangeEvent } from 'react';
import styled from '@themes/styled';

const StyledDatePicker = styled.input`
  background-color: ${({ theme }) => theme.palette.BG_COLOR01};
  font-size: 0.8rem;
  color: ${({ theme }) => theme.palette.PRIMARY};
  border-radius: 0.5rem;
  padding: 5px 12px;
  width: 440px;
  border: 1px solid ${({ theme }) => theme.palette.BG_COLOR02};
  &:focus {
    background-color: ${({ theme }) => theme.palette.LIGHT};
    border-color: ${({ theme }) => theme.palette.LINK_BLUE};
    box-shadow: 0 0 0 3px rgba(3, 102, 214, 0.3);
    outline: none;
  }
`;

interface Props {
  value?: string;
  onChange: (e: ChangeEvent<HTMLInputElement>) => void;
}

const DatePicker: FunctionComponent<Props> = ({ value, onChange }) => (
  <StyledDatePicker type="date" value={value} onChange={onChange} />
);

export default DatePicker;
