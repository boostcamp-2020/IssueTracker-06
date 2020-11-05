import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

import { BarSizeType, PROGRESS_DEFAULT_SIZE } from '.';

interface Props {
  ratio: number;
  //   eslint-disable-next-line react/require-default-props
  size?: BarSizeType;
}

interface StyledProps {
  ratio: number;
  size: BarSizeType;
}

const StyledProgressBar = styled.div<StyledProps>`
  width: 100%;
  height: ${({ size }) => size}px;
  background-color: ${({ theme }) => theme.palette.BG_COLOR04};
  border-radius: 6px;
  overflow: hidden;

  & > div {
    width: ${({ ratio }) => ratio * 100}%;
    height: 100%;
    background-color: ${({ theme }) => theme.palette.OPEN_GREEN};
  }
`;

const ProgressBar: FunctionComponent<Props> = ({
  ratio,
  size = PROGRESS_DEFAULT_SIZE,
}: Props) => (
  <StyledProgressBar ratio={ratio} size={size}>
    <div />
  </StyledProgressBar>
);

export default ProgressBar;
