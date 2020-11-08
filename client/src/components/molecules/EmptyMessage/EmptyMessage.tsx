import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import { Warning } from '@components/atoms/icons';

interface Props {
  Icon?: FunctionComponent;
  content?: string;
}

const StyledDiv = styled.div`
  text-align: center;
  & > svg {
    width: 2rem;
    height: 2rem;
    fill: ${({ theme }) => theme.palette.SECONDARY};
    margin: 8px 4px;
  }
`;

const StyledH3 = styled.h3`
  color: ${({ theme }) => theme.palette.PRIMARY};
  font-weight: 600;
  font-size: 1.5rem;
  margin: 16px 0;
`;

const XButton: FunctionComponent<Props> = ({
  Icon = Warning,
  content = 'No results matched your search.',
}) => {
  return (
    <StyledDiv>
      <Icon />
      <StyledH3>{content}</StyledH3>
    </StyledDiv>
  );
};

export default XButton;
