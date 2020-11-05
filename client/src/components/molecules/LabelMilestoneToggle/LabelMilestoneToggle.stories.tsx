import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';

import LabelMilestoneToggle, { ToggleType } from '.';

export default {
  title: 'Molecules/LabelMilestoneToggle',
  component: LabelMilestoneToggle,
};

export const Default = () => {
  const [focus, setFocus] = useState<ToggleType>('label');

  const onClickToggle = (clickedToggle: ToggleType) => {
    setFocus(clickedToggle);
  };
  return <LabelMilestoneToggle focus={focus} onClickToggle={onClickToggle} />;
};
