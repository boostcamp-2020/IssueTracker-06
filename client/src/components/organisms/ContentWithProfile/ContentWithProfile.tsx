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
  width: (100% -24px);
  box-sizing: border-box;

  & > img {
    width: 40px;
    height: 40px;
    margin-right: 20px;
  }
  & > div {
    flex-grow: 1;
    box-sizing: border-box;
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
