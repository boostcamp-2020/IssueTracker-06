import React, { ChangeEvent, FunctionComponent } from 'react';

import styled from '@themes/styled';
import Input from '@components/atoms/Input';
import IconWithText from '@components/molecules/TextWithIcon';
import CheckedIssue from '@components/atoms/icons/ChekcedIssue';
import Button from '@components/atoms/Button';
import TextareaWithImgUpload from '@components/molecules/TextareaWithImgUpload';

interface Props {
  title?: string;
  content: string;
  onChangeTitle?: (e: ChangeEvent<HTMLInputElement>) => void;
  onChangeContent: (e: ChangeEvent<HTMLInputElement>) => void;
}

const StyledWriteForm = styled.form`
  position: relative;
  border-radius: 0.5rem;
  border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};

  & > input {
    margin: 12px;
    width: calc(100% - 24px);
  }

  & > .tab-nav {
    margin-top: 8px;
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};

    & > nav {
      top: 1px;
      position: relative;
      width: fit-content;
      padding: 12px 16px;
      margin-left: 8px;
      border: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
      border-top-left-radius: 4px;
      border-top-right-radius: 4px;
      border-bottom: 1px solid ${({ theme }) => theme.palette.LIGHT};
      background-color: ${({ theme }) => theme.palette.LIGHT};
    }
  }

  & > .button-form {
    padding: 4px 12px;
    display: flex;
    justify-content: space-between;

    &.align-right {
      justify-content: flex-end;

      & > button {
        margin-left: 8px;
      }
    }
  }

  &::before {
    position: absolute;
    top: 14px;
    left: -7px;
    width: 12px;
    height: 12px;
    content: '';
    border-bottom: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-left: 1px solid ${({ theme }) => theme.palette.BORDER_COLOR};
    border-width: 1px;
    transform: rotate(45deg);
    background-color: ${({ theme }) => theme.palette.LIGHT};
  }
`;

const WriteForm: FunctionComponent<Props> = ({
  title,
  onChangeTitle,
  content,
  onChangeContent,
}) => (
  <StyledWriteForm>
    {onChangeTitle && (
      <Input
        type="text"
        placeholder="Title"
        value={title}
        onChange={onChangeTitle}
      />
    )}
    <div className="tab-nav">
      <nav>Write</nav>
    </div>
    <div className="write-content">
      <TextareaWithImgUpload value={content} onChange={onChangeContent} />
    </div>
    {onChangeTitle ? (
      <div className="button-form">
        <Button type="transparent">Cancel</Button>
        <Button type="primary">Submit new issue</Button>
      </div>
    ) : (
      <div className="button-form align-right">
        <Button type="error">
          <IconWithText text="Close issue" icon={CheckedIssue} />
        </Button>
        <Button type="primary">Comment</Button>
      </div>
    )}
  </StyledWriteForm>
);

export default WriteForm;
