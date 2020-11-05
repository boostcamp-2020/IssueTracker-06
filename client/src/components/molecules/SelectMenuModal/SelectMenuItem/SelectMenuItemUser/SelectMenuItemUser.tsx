import React, { FunctionComponent } from 'react';
import Title from '@/components/atoms/selectMenuItem/Title';
import Img from '@/components/atoms/selectMenuItem/Image';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  title: string;
  userImgSrc: string;
  alt: string;
}

const FilterItemUser: FunctionComponent<Props> = ({
  title,
  userImgSrc,
  alt,
}) => (
  <>
    <StyledTitleWrapper>
      <Img src={userImgSrc} alt={alt} />
      <Title text={title} />
    </StyledTitleWrapper>
  </>
);

export default FilterItemUser;
