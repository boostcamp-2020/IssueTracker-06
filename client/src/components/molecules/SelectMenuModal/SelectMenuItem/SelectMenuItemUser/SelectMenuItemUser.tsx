import React, { FunctionComponent } from 'react';
import Title from '@/components/atoms/selectMenuItem/Title';
import Img from '@/components/atoms/selectMenuItem/Image';
import StyledTitleWrapper from '../selectMenuItemStyle';

interface Props {
  title: string;
  userImgSrc: string;
  onClick?: () => void;
}

const FilterItemUser: FunctionComponent<Props> = ({
  title,
  userImgSrc,
  onClick,
}) => (
  <li>
    <StyledTitleWrapper onClick={onClick}>
      <Img src={userImgSrc} alt="profile" />
      <Title text={title} />
    </StyledTitleWrapper>
  </li>
);

export default FilterItemUser;
