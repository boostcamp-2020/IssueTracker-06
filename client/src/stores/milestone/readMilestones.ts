import { Milestone } from '@stores/type';

export const READ_MILESTONES_REQUEST = 'READ_MILESTONES_REQUEST';
export const READ_MILESTONES_SUCCESS = 'READ_MILESTONES_SUCCESS';
export const READ_MILESTONES_FAILURE = 'READ_MILESTONES_FAILURE';

export interface ReadMilestonesRequest {
  type: typeof READ_MILESTONES_REQUEST;
}

export interface ReadMilestonesSuccess {
  type: typeof READ_MILESTONES_SUCCESS;
  milestones: Milestone[];
}

export interface ReadMilestonesFailure {
  type: typeof READ_MILESTONES_FAILURE;
  error: string;
}

export interface ReadMilestonesAction {
  request: () => ReadMilestonesRequest;
  success: (milestones: Milestone[]) => ReadMilestonesSuccess;
  failure: (error: string) => ReadMilestonesFailure;
}

export type ReadMilestonesActions =
  | ReadMilestonesRequest
  | ReadMilestonesSuccess
  | ReadMilestonesFailure;

const readMilestonesAction = (): ReadMilestonesAction => ({
  request: (): ReadMilestonesRequest => ({ type: READ_MILESTONES_REQUEST }),
  success: (milestones: Milestone[]): ReadMilestonesSuccess => ({
    type: READ_MILESTONES_SUCCESS,
    milestones,
  }),
  failure: (error: string): ReadMilestonesFailure => ({
    type: READ_MILESTONES_FAILURE,
    error,
  }),
});

export default readMilestonesAction;
