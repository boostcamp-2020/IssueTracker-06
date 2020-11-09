import React, { Children, FunctionComponent } from 'react';
import styled from '@themes/styled';
import Button from '@components/atoms/Button';
import FilterModal from '@components/molecules/SelectMenuModal';
import TextWithIcon from '@/components/molecules/TextWithIcon';

interface Props {
  type: 'transparent' | 'default' | 'error' | 'primary' | undefined;
  label: string;
  optionHeader: string;
  options: string[] | React.ReactChild;
  Icon: FunctionComponent;
  onClick: () => void;
  input?: string;
  display: 'none' | 'display';
  keys: string[];
}

const SearchFilter: FunctionComponent<Props> = ({
  type,
  label,
  optionHeader,
  options,
  Icon,
  onClick,
  display,
  input,
  keys,
}) => {
  return (
    <>
      <Button type={type}>
        <TextWithIcon
          icon={Icon}
          text={label}
          onClick={onClick}
          align="right"
        />
      </Button>

      <FilterModal
        display={display}
        optionHeader={optionHeader}
        input={input}
        options={options}
        keys={keys}
      />
    </>
  );
};

export default SearchFilter;
