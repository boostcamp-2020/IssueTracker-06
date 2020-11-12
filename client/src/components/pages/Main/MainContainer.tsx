import React, {
  FunctionComponent,
  useCallback,
  useEffect,
  useContext,
  useState,
} from 'react';
import { useHistory } from 'react-router-dom';
import issueContext from '@stores/issue';

import useChange from '@hooks/useChange';
import getIssuesAction from '@/stores/issue/getIssues';
import getIssuesAPI from '@apis/getIssues';
import { ToggleType } from '@components/molecules/LabelMilestoneToggle';

import MainPresenter from './MainPresenter';

const DUMMY = {
  labelCount: 5,
  milestoneCount: 4,
};

const MainContainer: FunctionComponent = () => {
  const { issues, asyncDispatch } = useContext(issueContext);
  const [isOpenIssue, setIsOpenIssue] = useState(true);
  const [inputSearchFilter, , onChangeInputSearchFilter] = useChange('');
  const [checkedIssues, setCheckedIssues] = useState<number[]>([]);
  const history = useHistory();

  const onClickOpenOrCloseFilter = useCallback((isOpen: boolean) => {
    setIsOpenIssue(isOpen);
  }, []);

  const onClickLabelMilestoneToggle = useCallback(
    (clickedToggle: ToggleType) => {
      history.push(`/${clickedToggle}`);
    },
    [],
  );

  const onCheckIssue = useCallback(
    (id: number) => {
      const isCheckedIssue = checkedIssues.includes(id);
      if (!isCheckedIssue) {
        setCheckedIssues([...checkedIssues, id]);
        return;
      }
      const deletedIssues = checkedIssues.filter((issue) => issue !== id);
      setCheckedIssues(deletedIssues);
    },
    [checkedIssues],
  );

  const onCheckIssueListHeader = useCallback(
    (isChecked: boolean) => {
      if (!isChecked) {
        setCheckedIssues([]);
        return;
      }
      const totalIssuesId = issues.map((issue) => issue.id);
      setCheckedIssues(totalIssuesId);
    },
    [issues],
  );

  useEffect(() => {
    if (issues.length === 0 && asyncDispatch) {
      asyncDispatch(getIssuesAction(), getIssuesAPI);
    }
  }, []);

  return (
    <MainPresenter
      inputSearchFilter={inputSearchFilter}
      onChangeInputSearchFilter={onChangeInputSearchFilter}
      labelCount={DUMMY.labelCount}
      milestoneCount={DUMMY.milestoneCount}
      onClickLabelMilestoneToggle={onClickLabelMilestoneToggle}
      onCheckIssue={onCheckIssue}
      onCheckIssueListHeader={onCheckIssueListHeader}
      onClickOpenOrCloseFilter={onClickOpenOrCloseFilter}
      issues={issues}
      isOpenIssue={isOpenIssue}
      checkedIssues={checkedIssues}
    />
  );
};

export default MainContainer;
