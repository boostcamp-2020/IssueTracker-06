import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  icon: FunctionComponent;
  text: string;
}

const StyledIconText = styled.span`
  display: flex;
  align-items: center;
  color: ${({ theme }) => theme.palette.PRIMARY};

  & > svg {
    width: 1rem;
    fill: currentColor;
    margin-right: 6px;
  }

  & > span {
    font-weight: 700;
    font-size: 0.95rem;
  }
`;

const IconText: FunctionComponent<Props> = ({ icon: Icon, text }) => (
  <StyledIconText>
    <Icon />
    <span>{text}</span>
  </StyledIconText>
);

export default IconText;
