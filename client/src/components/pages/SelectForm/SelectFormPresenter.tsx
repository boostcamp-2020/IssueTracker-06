import React, { FunctionComponent, ChangeEvent } from 'react';
import IssueSelectForm from '@components/organisms/IssueSelectForm';
import { User, Label, Milestone } from '@stores/type';

interface Props {
  onSelectAssignees: (selected: User) => void;
  onSelectLabels: (selected: Label) => void;
  onSelectMilestone: (selected: Milestone) => void;
  selectedAssignees: User[];
  selectedLabels: Label[];
  selectedMilestone?: Milestone[];
}

const SelectFormPresenter: FunctionComponent<Props> = ({
  onSelectAssignees,
  onSelectLabels,
  onSelectMilestone,
  selectedAssignees,
  selectedLabels,
  selectedMilestone,
}) => {
  return (
    <>
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
    </>
  );
};

export default SelectFormPresenter;
