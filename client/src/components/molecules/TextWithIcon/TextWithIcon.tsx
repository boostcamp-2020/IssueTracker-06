import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import BoldText from '@components/atoms/BoldText';
import { AlignType } from '.';

interface Props {
  icon: FunctionComponent;
  text: string;
  align?: AlignType;
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
`;

const TextWithIcon: FunctionComponent<Props> = ({
  icon: Icon,
  text,
  align = 'left',
  onClick,
  className = '',
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
  </StyledTextWithIcon>
);

export default TextWithIcon;
