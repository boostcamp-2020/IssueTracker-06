import React, { FunctionComponent } from 'react';

import styled from '@themes/styled';
import Profile from '@components/atoms/selectMenuItem/Image';
import IssueContent from '@components/organisms/IssueContent';

interface Props {
  myContent?: boolean;
  myComment?: boolean;
  profile: string;
  name: string;
  content: string;
  onClick?: () => void;
}

const StyledContentWithProfile = styled.div`
  display: flex;

  & > img {
    width: 40px;
    height: 40px;
    margin-right: 20px;
  }

  .content {
    min-width: 740px;
  }
`;

const ContentWithProfile: FunctionComponent<Props> = ({
  myContent = false,
  myComment = false,
  profile,
  name,
  content,
  onClick,
}) => (
  <StyledContentWithProfile>
    <Profile src={profile} alt="profile" />
    <IssueContent
      myContent={myContent}
      myComment={myComment}
      name={name}
      content={content}
      onClick={onClick}
    />
  </StyledContentWithProfile>
);

export default ContentWithProfile;
