export { default } from './ProgressBar';

export const PROGRESS_DEFAULT_SIZE = 8 as const;
export const PROGRESS_LARGE_SIZE = 10 as const;

export type BarSizeType =
  | typeof PROGRESS_DEFAULT_SIZE
  | typeof PROGRESS_LARGE_SIZE;
