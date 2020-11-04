import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import { AlignType } from '.';

interface Props {
  icon: FunctionComponent;
  text: string;
  align?: AlignType;
}

interface StyledProps {
  alignIcon: AlignType;
}

const StyledIconText = styled.span<StyledProps>`
  display: flex;
  align-items: center;
  color: ${({ theme }) => theme.palette.PRIMARY};

  & > svg {
    width: 1rem;
    fill: currentColor;
    margin: ${({ alignIcon }) =>
      alignIcon === 'left' ? '0 6px 0' : '0 0 0 6px'};
  }

  & > span {
    font-weight: 700;
    font-size: 0.95rem;
  }
`;

const IconText: FunctionComponent<Props> = ({
  icon: Icon,
  text,
  align = 'left',
}) => (
  <StyledIconText alignIcon={align}>
    {align === 'left' ? (
      <>
        <Icon />
        <span>{text}</span>
      </>
    ) : (
      <>
        <span>{text}</span>
        <Icon />
      </>
    )}
  </StyledIconText>
);

export default IconText;
