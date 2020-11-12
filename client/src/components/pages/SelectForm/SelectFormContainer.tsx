import React, {
  FunctionComponent,
  useContext,
  useEffect,
  useState,
} from 'react';

import labelContext from '@stores/label';
import milestoneContext from '@stores/milestone';
import readLabelsAction from '@stores/label/readLabels';
import readMilestonesAction from '@stores/milestone/readMilestones';
import { User, Label, Milestone } from '@stores/type';
import readLabelsAPI from '@apis/readLabels';
import readMilestonesAPI from '@apis/readMilestones';
import SelectFormPresenter from './SelectFormPresenter';

const SelectFormContainer: FunctionComponent = () => {
  const { asyncDispatch: asyncDispatchLabel } = useContext(labelContext);
  const { asyncDispatch: asyncDispatchMilestone } = useContext(
    milestoneContext,
  );

  const [selectedAssignees, setSelectedAssignees] = useState<User[]>([]);
  const [selectedLabels, setSelectedLabels] = useState<Label[]>([]);
  const [selectedMilestone, setSelectedMilestone] = useState<Milestone[]>([]);

  useEffect(() => {
    if (asyncDispatchLabel) {
      asyncDispatchLabel(readLabelsAction(), readLabelsAPI as any);
    }
    if (asyncDispatchMilestone) {
      asyncDispatchMilestone(readMilestonesAction(), readMilestonesAPI as any);
    }
  }, []);

  const onSelectItems = <T extends User | Label | Milestone>(
    curSelectedItems: T[],
    setSelectedItems: React.Dispatch<React.SetStateAction<T[]>>,
  ) => (selected: T) => {
    const isAlreadySelected = curSelectedItems
      .map((item) => item.id)
      .includes(selected.id);
    if (!isAlreadySelected) {
      setSelectedItems((arr) => [...arr, selected]);
      return;
    }
    const optionsWithoutCur = curSelectedItems.filter(
      (item) => item.id !== selected.id,
    );
    setSelectedItems(optionsWithoutCur);
  };

  const onSelectMilestone = (selected: Milestone) => {
    setSelectedMilestone([selected]);
  };

  return (
    <SelectFormPresenter
      onSelectAssignees={onSelectItems(selectedAssignees, setSelectedAssignees)}
      onSelectLabels={onSelectItems(selectedLabels, setSelectedLabels)}
      onSelectMilestone={onSelectMilestone}
      selectedAssignees={selectedAssignees}
      selectedLabels={selectedLabels}
      selectedMilestone={selectedMilestone}
    />
  );
};

export default SelectFormContainer;
