import React from 'react';
import styled from '@emotion/styled';

import { Dropdown, Reset, Warning, Change } from '.';
import IconMilestone from './IconMilestone';
import IconSearch from './IconSearch';
import IconTag from './IconTag';
import IssueClosed from './IssueClosed';
import IssueOpened from './IssueOpened';

const StyledIcons = styled.div`
  display: flex;
  flex-wrap: wrap;
  align-items: center;

  & > svg {
    width: 50px;
    margin-right: 10px;
  }
`;

export default {
  title: 'Atoms/Icons',
  component: StyledIcons,
};

export const Default = () => {
  return (
    <StyledIcons>
      <Dropdown />
      <Reset />
      <Warning />
      <IconMilestone />
      <IconSearch />
      <IconTag />
      <IssueOpened />
      <IssueClosed />
      <Change />
    </StyledIcons>
  );
};
