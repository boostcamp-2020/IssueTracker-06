import React, { FunctionComponent } from 'react';
import ColorSwatch from '@/components/atoms/selectMenuItem/ColorSwatch';
import Description from '@/components/atoms/selectMenuItem/Description';
import Title from '@/components/atoms/selectMenuItem/Title';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  swatchColor: string;
  title: string;
  description?: string;
}

const FilterItemLabel: FunctionComponent<Props> = ({
  swatchColor,
  title,
  description,
}) => (
  <>
    <StyledTitleWrapper>
      <ColorSwatch bgColor={swatchColor} />
      <Title text={title} />
    </StyledTitleWrapper>
    <div>
      <Description text={description} />
    </div>
  </>
);

export default FilterItemLabel;
