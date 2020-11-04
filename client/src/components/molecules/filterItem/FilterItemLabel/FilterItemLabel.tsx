import React, { FunctionComponent } from 'react';
import ColorSwatch from '@components/atoms/filterItem/ColorSwatch';
import Description from '@/components/atoms/filterItem/Description';
import Title from '@/components/atoms/filterItem/Title';

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
    <ColorSwatch bgColor={swatchColor} />
    <div>
      <Title text={title} />
      <Description text={description} />
    </div>
  </>
);

export default FilterItemLabel;
