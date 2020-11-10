import React, { FunctionComponent, ChangeEvent } from 'react';

import styled from '@themes/styled';
import WriteForm from '@components/organisms/WriteForm';
import Profile from '@components/atoms/selectMenuItem/Image';

interface Props {
  profile: string;
  title?: string;
  content: string;
  onChangeTitle?: (e: ChangeEvent<HTMLInputElement>) => void;
  onChangeContent: (e: ChangeEvent<HTMLTextAreaElement>) => void;
}

const StyledWriteFormWithProfile = styled.div`
  display: flex;

  & > img {
    width: 40px;
    height: 40px;
    margin-right: 20px;
  }

  & > form {
    min-width: 740px;
  }
`;

const WriteFormWithProfile: FunctionComponent<Props> = ({
  profile,
  title,
  content,
  onChangeTitle,
  onChangeContent,
}) => (
  <StyledWriteFormWithProfile>
    <Profile src={profile} alt="profile" />
    <WriteForm
      title={title}
      content={content}
      onChangeTitle={onChangeTitle}
      onChangeContent={onChangeContent}
    />
  </StyledWriteFormWithProfile>
);

export default WriteFormWithProfile;
