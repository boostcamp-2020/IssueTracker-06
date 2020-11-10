import React from 'react';
import styled from '@emotion/styled';

import {
  ChangeIcon,
  DropdownIcon,
  IssueClosedIcon,
  IssueOpenedIcon,
  MilestoneIcon,
  ResetIcon,
  SearchIcon,
  SettingIcon,
  TagIcon,
  WarningIcon,
} from '.';

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
      <ChangeIcon />
      <DropdownIcon />
      <IssueClosedIcon />
      <IssueOpenedIcon />
      <MilestoneIcon />
      <ResetIcon />
      <SearchIcon />
      <SettingIcon />
      <TagIcon />
      <WarningIcon />
    </StyledIcons>
  );
};
