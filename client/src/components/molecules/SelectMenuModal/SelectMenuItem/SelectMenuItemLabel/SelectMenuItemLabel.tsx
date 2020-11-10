import React, { FunctionComponent } from 'react';
import ColorSwatch from '@/components/atoms/selectMenuItem/ColorSwatch';
import Description from '@/components/atoms/selectMenuItem/Description';
import Title from '@/components/atoms/selectMenuItem/Title';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  swatchColor: string;
  title: string;
  description?: string;
  onClick?: () => void;
}

const FilterItemLabel: FunctionComponent<Props> = ({
  swatchColor,
  title,
  description,
  onClick,
}) => (
  <li>
    <StyledTitleWrapper onClick={onClick}>
      <ColorSwatch bgColor={swatchColor} />
      <Title text={title} />
    </StyledTitleWrapper>
    {description && <Description text={description} />}
  </li>
);

export default FilterItemLabel;
