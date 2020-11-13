import React, { FunctionComponent } from 'react';
import { StyledImg as Img } from '@components/atoms/selectMenuItem/Image';
import styled from '@themes/styled';
import { User } from '@stores/type';

interface Props {
  users?: User[];
}

interface StyledProps {
  left: number;
}

const StyledImg = styled(Img)<StyledProps>`
  left: ${({ left }) => left}rem;
`;

const StyledDiv = styled.div`
  position: relative;
  margin: 8px 140px 8px 8px;
  & > img {
    position: absolute;
  }
`;

const Assignees: FunctionComponent<Props> = ({ users }) => (
  <StyledDiv>
    {users?.map((user, i) => (
      <StyledImg src={user.profile} key={user.id} left={0.6 * i} />
    ))}
  </StyledDiv>
);

export default Assignees;
