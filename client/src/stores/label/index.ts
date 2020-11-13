/* eslint-disable @typescript-eslint/no-empty-function */
import { createContext, Dispatch } from 'react';
import { Label } from '../type';
import {
  ReadLabelsAction,
  ReadLabelsActions,
  READ_LABELS_SUCCESS,
} from './readLabels';

export type Actions = ReadLabelsActions;
export type ActionCreator = ReadLabelsAction;

interface LabelsState {
  labels: Label[];
}

interface LabelsContext extends LabelsState {
  dispatch: Dispatch<Actions>;
  asyncDispatch?: (
    action: ActionCreator,
    apiCallback: (requestActions: Actions) => Promise<any>,
  ) => Promise<void>;
}

export const initialLabels: LabelsState = {
  labels: [],
};

export const reducer = (
  state: LabelsState = initialLabels,
  action: Actions,
): LabelsState => {
  switch (action.type) {
    case READ_LABELS_SUCCESS: {
      const { labels } = action;
      return {
        labels,
      };
    }
    default:
      return state;
  }
};

export default createContext<LabelsContext>({
  ...initialLabels,
  dispatch: () => {},
});
