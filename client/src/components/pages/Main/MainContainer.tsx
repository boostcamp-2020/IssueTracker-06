import React, {
  FunctionComponent,
  useCallback,
  useEffect,
  useContext,
  useState,
} from 'react';
import issueContext from '@stores/.';

import useChange from '@hooks/useChange';
import getIssuesAction from '@stores/getIssues';
import getIssuesAPI from '@apis/getIssues';

import MainPresenter from './MainPresenter';

const DUMMY = {
  labelCount: 5,
  milestoneCount: 4,
};

const MainContainer: FunctionComponent = () => {
  const { issues, asyncDispatch } = useContext(issueContext);
  const [inputSearchFilter, , onChangeInputSearchFilter] = useChange('');
  const [checkedIssues, setCheckedIssues] = useState<number[]>([]);

  const onClickLabelMilestoneToggle = useCallback(() => {}, []);

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
      issues={issues}
      checkedIssues={checkedIssues}
    />
  );
};

export default MainContainer;
