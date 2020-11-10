import React, { FunctionComponent } from 'react';

import styled from '@themes/styled';
import { GithubIcon } from '@components/atoms/icons';

interface Props {
  children: React.ReactChild;
}

const StyledHeader = styled.header`
  width: 100%;
  height: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: ${({ theme }) => theme.palette.PRIMARY};
  color: ${({ theme }) => theme.palette.LIGHT};

  & > svg {
    width: 40px;
    fill: currentColor;
  }

  & > span {
    margin-left: 8px;
    font-size: 1.5rem;
    font-weight: 700;
  }
`;

const AppLayout: FunctionComponent<Props> = ({ children }) => (
  <>
    <StyledHeader>
      <GithubIcon />
      <span>Issue Tracker</span>
    </StyledHeader>
    <section>{children}</section>
  </>
);

export default AppLayout;
