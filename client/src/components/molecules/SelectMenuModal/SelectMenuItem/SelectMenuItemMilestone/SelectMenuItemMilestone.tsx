import React, { FunctionComponent, useState, useCallback } from 'react';
import Description from '@/components/atoms/selectMenuItem/Description';
import Title from '@/components/atoms/selectMenuItem/Title';
import styled from '@themes/styled';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  title: string;
  description?: string;
  onClick?: () => void;
  isClicked?: boolean;
}

const StyledLi = styled.li`
  &.clicked {
    background-color: ${({ theme }) => theme.palette.LIGHT_BLUE01};
  }
`;

const SelectMenuItemMilestone: FunctionComponent<Props> = ({
  title,
  description,
  onClick,
  isClicked,
}) => {
  return (
    <StyledLi className={isClicked ? 'clicked' : ''}>
      <StyledTitleWrapper onClick={onClick}>
        <Title text={title} />
      </StyledTitleWrapper>
      {description && <Description text={description} />}
    </StyledLi>
  );
};

export default SelectMenuItemMilestone;
