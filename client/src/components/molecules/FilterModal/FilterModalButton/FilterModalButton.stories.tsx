import React, { useState } from 'react';
import { text } from '@storybook/addon-knobs';
import FilterItemLabel from '@/components/molecules/FilterModal/FilterModalButton/filterItem/FilterItemLabel';
import FilterModalButton from './FilterModalButton';

export default {
  component: FilterModalButton,
  title: 'Molecules/FilterModalButton',
};
export const Default = () => {
  const content = <FilterItemLabel swatchColor="#eee" title="1" />;
  const onClick = () => {
    // 버튼 메서드
  };
  return <FilterModalButton content={content} onClick={onClick} />;
};
