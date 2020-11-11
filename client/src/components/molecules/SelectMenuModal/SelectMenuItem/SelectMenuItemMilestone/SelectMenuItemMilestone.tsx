import React, { FunctionComponent, useState, useCallback } from 'react';
import Description from '@/components/atoms/selectMenuItem/Description';
import Title from '@/components/atoms/selectMenuItem/Title';
import styled from '@themes/styled';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  title: string;
  description?: string;
  onClick?: (arg: any) => void;
}

interface StyledProps {
  isClicked: boolean;
}

const StyledLi = styled.li<StyledProps>`
  background-color: ${({ isClicked, theme }) =>
    isClicked && theme.palette.BG_COLOR02};
`;

const SelectMenuItemMilestone: FunctionComponent<Props> = ({
  title,
  description,
  onClick,
}) => {
  const [isClicked, setIsClicked] = useState(false);

  const handleClick = useCallback(() => {
    if (onClick) {
      onClick(setIsClicked(!isClicked));
    }
  }, [isClicked]);

  return (
    <StyledLi isClicked={isClicked}>
      <StyledTitleWrapper onClick={handleClick}>
        <Title text={title} />
      </StyledTitleWrapper>
      {description && <Description text={description} />}
    </StyledLi>
  );
};

export default SelectMenuItemMilestone;
