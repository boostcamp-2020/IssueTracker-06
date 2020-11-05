import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

const StyledImg = styled.img`
  display: inline-block;
  margin-right: 0.5rem;
  border-radius: 50%;
  overflow: hidden;
  vertical-align: middle;
  width: 20px;
  height: 20px;
`;

interface Props {
  src: string;
  alt: string;
}

const Img: FunctionComponent<Props> = ({ src, alt }) => (
  <StyledImg src={src} alt={alt} />
);

export default Img;
