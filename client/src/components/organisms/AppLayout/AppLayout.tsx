import React, { FunctionComponent } from 'react';
import { Link } from 'react-router-dom';

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
  background-color: ${({ theme }) => theme.palette.PRIMARY};

  & > a {
    display: flex;
    align-items: center;
    color: ${({ theme }) => theme.palette.LIGHT};
    text-decoration: none;

    & > svg {
      width: 40px;
      fill: currentColor;
    }

    & > span {
      margin-left: 8px;
      font-size: 1.5rem;
      font-weight: 700;
    }
  }
`;

const AppLayout: FunctionComponent<Props> = ({ children }) => (
  <>
    <StyledHeader>
      <Link to="/">
        <GithubIcon />
        <span>Issue Tracker</span>
      </Link>
    </StyledHeader>
    <section>{children}</section>
  </>
);

export default AppLayout;
