import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';
import { WarningIcon } from '@components/atoms/icons';
import BoldText from '@components/atoms/BoldText';

interface Props {
  content: string;
}

const StyledDiv = styled.div`
  text-align: center;
  & > svg {
    width: 2rem;
    height: 2rem;
    fill: ${({ theme }) => theme.palette.SECONDARY};
    margin: 8px 4px;
  }
  & > span {
    display: block;
    font-size: 2rem;
  }
`;

const XButton: FunctionComponent<Props> = ({
  content = 'No results matched your search.',
}) => {
  return (
    <StyledDiv>
      <WarningIcon />
      <BoldText value={content} />
    </StyledDiv>
  );
};

export default XButton;
