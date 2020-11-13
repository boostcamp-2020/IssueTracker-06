import React, { FunctionComponent, ChangeEvent } from 'react';
import AppLayout from '@components/organisms/AppLayout';
import WriteFormWithProfile from '@components/organisms/WriteFormWithProfile';
import SelectForm from '@components/pages/SelectForm';
import { User, Label, Milestone } from '@stores/type';
import styled from '@themes/styled';

const StyledSection = styled.section`
  display: flex;
  justify-content: space-between;
  margin: 3% 10% 0 10%;
  & > div:nth-child(2) {
    margin-left: 5rem;
    width: 290px;
    ul {
      top: 1.5rem;
      z-index: 1;
      li {
        padding: 8px 20px;
      }
    }
  }
  textarea {
    height: 380px;
    padding: 1rem;
  }
`;

interface Props {
  title?: string;
  onChangeTitle?: (e: ChangeEvent<HTMLInputElement>) => void;
  content: string;
  onChangeContent: (e: ChangeEvent<HTMLTextAreaElement>) => void;
}

const CreateIssuePresenter: FunctionComponent<Props> = ({
  title,
  content,
  onChangeTitle,
  onChangeContent,
}) => {
  return (
    <AppLayout>
      <StyledSection>
        <WriteFormWithProfile
          profile="https://avatars0.githubusercontent.com/u/37282087?s=40&amp;v=4"
          title={title}
          content={content}
          onChangeContent={onChangeContent}
          onChangeTitle={onChangeTitle}
        />
        <div>
          <SelectForm assignees={[]} labels={[]} milestone={[]} />
        </div>
      </StyledSection>
    </AppLayout>
  );
};

export default CreateIssuePresenter;
