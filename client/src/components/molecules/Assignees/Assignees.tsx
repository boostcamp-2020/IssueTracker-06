import React, { FunctionComponent } from 'react';
import { StyledImg as Img } from '@components/atoms/selectMenuItem/Image';
import styled from '@themes/styled';
import { User } from '.';

interface Props {
  users?: User[];
}

interface StyledProps {
  left: string;
}

const StyledImg = styled(Img)<StyledProps>`
  left: ${({ left }) => left};
`;

const StyledDiv = styled.div`
  position: relative;
  margin: 8px;
  & > img {
    position: absolute;
  }
`;

const Assignees: FunctionComponent<Props> = ({ users }) => (
  <StyledDiv>
    {users?.map((user, i) => (
      <StyledImg src={user.img} key={user.id} left={`${0.6 * i}rem`} />
    ))}
  </StyledDiv>
);

export default Assignees;
