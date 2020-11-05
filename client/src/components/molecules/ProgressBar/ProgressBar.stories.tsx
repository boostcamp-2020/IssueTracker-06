import React from 'react';
import { number } from '@storybook/addon-knobs';

import ProgressBar, { PROGRESS_LARGE_SIZE } from '.';

export default {
  title: 'Molecules/ProgressBar',
  component: ProgressBar,
};

export const Defalut = () => {
  const ratio = number('ratio (0-10)', 0);

  return <ProgressBar ratio={ratio / 10} />;
};

export const Large = () => {
  const ratio = number('ratio (0-10)', 0);

  return <ProgressBar ratio={ratio / 10} size={PROGRESS_LARGE_SIZE} />;
};
