import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import BoldText from '@components/atoms/BoldText';
import { AlignType } from '.';

interface Props {
  icon: FunctionComponent;
  text: string;
  align?: AlignType;
  count?: number;
  onClick?: () => void;
  className?: string;
}

interface StyledProps {
  alignIcon: AlignType;
}

const StyledTextWithIcon = styled.span<StyledProps>`
  display: flex;
  align-items: center;
  color: ${({ theme }) => theme.palette.PRIMARY};

  & > svg {
    width: 1rem;
    fill: currentColor;
    margin: ${({ alignIcon }) =>
      alignIcon === 'left' ? '0 6px 0 0' : '0 0 0 6px'};
  }

  & .toggle-count {
    font-size: 0.7rem;
    font-weight: 600;
    background-color: ${({ theme }) => theme.palette.BORDER_COLOR};
    padding: 3.5px 6px;
    margin-left: 4px;
    border-radius: 50%;
  }
`;

const TextWithIcon: FunctionComponent<Props> = ({
  icon: Icon,
  text,
  align = 'left',
  onClick,
  className = '',
  count,
}) => (
  <StyledTextWithIcon alignIcon={align} onClick={onClick} className={className}>
    {align === 'left' ? (
      <>
        <Icon />
        <BoldText value={text} />
      </>
    ) : (
      <>
        <BoldText value={text} />
        <Icon />
      </>
    )}
    {count !== undefined && <span className="toggle-count">{count}</span>}
  </StyledTextWithIcon>
);

export default TextWithIcon;
