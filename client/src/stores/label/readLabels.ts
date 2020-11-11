import { Label } from '@stores/type';

export const READ_LABELS_REQUEST = 'READ_LABELS_REQUEST';
export const READ_LABELS_SUCCESS = 'READ_LABELS_SUCESS';
export const READ_LABELS_FAILURE = 'READ_LABELS_FAILURE';

export interface ReadLabelsRequest {
  type: typeof READ_LABELS_REQUEST;
}

export interface ReadLabelsSuccess {
  type: typeof READ_LABELS_SUCCESS;
  labels: Label[];
}

export interface ReadLabelsFailure {
  type: typeof READ_LABELS_FAILURE;
  error: string;
}

export interface ReadLabelsAction {
  request: () => ReadLabelsRequest;
  success: (labels: Label[]) => ReadLabelsSuccess;
  failure: (error: string) => ReadLabelsFailure;
}

export type ReadLabelsActions =
  | ReadLabelsRequest
  | ReadLabelsSuccess
  | ReadLabelsFailure;

const readLabelsAction = (): ReadLabelsAction => ({
  request: (): ReadLabelsRequest => ({ type: READ_LABELS_REQUEST }),
  success: (labels: Label[]): ReadLabelsSuccess => ({
    type: READ_LABELS_SUCCESS,
    labels,
  }),
  failure: (error: string): ReadLabelsFailure => ({
    type: READ_LABELS_FAILURE,
    error,
  }),
});

export default readLabelsAction;
