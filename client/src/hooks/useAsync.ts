import { Dispatch } from 'react';
import { ActionCreator, Actions } from '@stores/.';

const useAsync = (dispatch: Dispatch<Actions>) => async (
  action: ActionCreator,
  apiCallback: (requestActions: Actions) => Promise<any> | (() => Promise<any>),
): Promise<void> => {
  try {
    const requestAction = action.request();
    dispatch(requestAction);
    const data = await apiCallback(requestAction);

    if (data) {
      dispatch(action.success(data));
      return;
    }
    dispatch(action.failure('error'));
  } catch (error) {
    console.error(error);
    dispatch(action.failure(error.message));
  }
};

export default useAsync;
