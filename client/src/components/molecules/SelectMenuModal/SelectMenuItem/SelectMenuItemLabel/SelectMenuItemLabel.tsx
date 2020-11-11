import React, { FunctionComponent, useState, useCallback } from 'react';
import ColorSwatch from '@/components/atoms/selectMenuItem/ColorSwatch';
import Description from '@/components/atoms/selectMenuItem/Description';
import Title from '@/components/atoms/selectMenuItem/Title';
import styled from '@themes/styled';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  swatchColor: string;
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

const FilterItemLabel: FunctionComponent<Props> = ({
  swatchColor,
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
        <ColorSwatch bgColor={swatchColor} />
        <Title text={title} />
      </StyledTitleWrapper>
      {description && <Description text={description} />}
    </StyledLi>
  );
};

export default FilterItemLabel;
