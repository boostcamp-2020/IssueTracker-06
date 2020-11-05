import React, { FunctionComponent } from 'react';
import ColorSwatch from '@components/atoms/filterItem/ColorSwatch';
import Description from '@components/atoms/filterItem/Description';
import Title from '@components/atoms/filterItem/Title';

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
    <div
      style={{ display: 'flex', alignItems: 'center', marginBottom: '0.2rem' }}
    >
      <ColorSwatch bgColor={swatchColor} />
      <Title text={title} />
    </div>
    <div>
      <Description text={description} />
    </div>
  </>
);

export default FilterItemLabel;
