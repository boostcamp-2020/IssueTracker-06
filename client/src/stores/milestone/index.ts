/* eslint-disable @typescript-eslint/no-empty-function */
import { createContext, Dispatch } from 'react';
import { Milestone } from '../type';
import {
  ReadMilestonesAction,
  ReadMilestonesActions,
  READ_MILESTONES_SUCCESS,
} from './readMilestones';

export type Actions = ReadMilestonesActions;
export type ActionCreator = ReadMilestonesAction;

interface MilestonesState {
  milestones: Milestone[];
}

interface MilestonesContext extends MilestonesState {
  dispatch: Dispatch<Actions>;
  asyncDispatch?: (
    action: ActionCreator,
    apiCallback: (requestActions: Actions) => Promise<any>,
  ) => Promise<void>;
}

export const initialMilestones: MilestonesState = {
  milestones: [],
};

export const reducer = (
  state: MilestonesState = initialMilestones,
  action: Actions,
): MilestonesState => {
  switch (action.type) {
    case READ_MILESTONES_SUCCESS: {
      const { milestones } = action;
      return {
        milestones,
      };
    }
    default:
      return state;
  }
};

export default createContext<MilestonesContext>({
  ...initialMilestones,
  dispatch: () => {},
});
