import { Dispatch } from 'react';

type ActionCreator = (...value: any) => any;

interface CommonActionCreator {
  request: ActionCreator;
  success: ActionCreator;
  failure: ActionCreator;
}

const useAsync = <T>(dispatch: Dispatch<T>) => async <
  A extends CommonActionCreator
>(
  action: A,
  apiCallback: (requestActions: T) => Promise<any> | ((...rest: any) => Promise<any>),
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
