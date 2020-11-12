import React, { FunctionComponent, ChangeEvent } from 'react';
import AppLayout from '@components/organisms/AppLayout';
import WriteFormWithProfile from '@components/organisms/WriteFormWithProfile';
import IssueSelectForm from '@components/organisms/IssueSelectForm';
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
  onSelectAssignees: (selected: User) => void;
  onSelectLabels: (selected: Label) => void;
  onSelectMilestone: (selected: Milestone) => void;
  selectedAssignees: User[];
  selectedLabels: Label[];
  selectedMilestone?: Milestone[];
}

const CreateIssuePresenter: FunctionComponent<Props> = ({
  title,
  content,
  onChangeTitle,
  onChangeContent,
  onSelectAssignees,
  onSelectLabels,
  onSelectMilestone,
  selectedAssignees,
  selectedLabels,
  selectedMilestone,
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
          <IssueSelectForm
            title="Assignees"
            emptyMessage="No one—assign yourself"
            optionHeader="Assign up to 10 people to this issue"
            onSelect={onSelectAssignees as any}
            selectedItems={selectedAssignees}
          />
          <IssueSelectForm
            title="Labels"
            emptyMessage="None yet"
            optionHeader="Apply labels to this issue"
            onSelect={onSelectLabels as any}
            selectedItems={selectedLabels}
          />
          <IssueSelectForm
            title="Milestone"
            emptyMessage="No milestone"
            optionHeader="Set milestone"
            onSelect={onSelectMilestone as any}
            selectedItems={selectedMilestone}
          />
        </div>
      </StyledSection>
    </AppLayout>
  );
};

export default CreateIssuePresenter;
