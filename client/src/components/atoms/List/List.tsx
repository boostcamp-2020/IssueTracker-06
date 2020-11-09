import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  content: React.ReactChild;
}

const StyledLi = styled.li`
  border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
  & > h3 {
    font-weight: 600;
  }

  & > button {
    width: 100%;
    text-align: left;
  }

  & > button,
  & > h3 {
    color: ${({ theme }) => theme.palette.PRIMARY};
    font-size: 0.8rem;
    padding: 7px 16px;
  }

  & > button:hover {
    background-color: ${({ theme }) => theme.palette.BG_COLOR02};
  }

  & > button:focus {
    outline: none;
  }

  &:last-child {
    border-bottom: none;
  }
`;

const List: FunctionComponent<Props> = ({ content }) => (
  <StyledLi>{content}</StyledLi>
);

export default List;
