import React, { Children, FunctionComponent } from 'react';
import styled from '@themes/styled';
import Button, { ButtonType } from '@components/atoms/Button';
import FilterModal from '@components/molecules/SelectMenuModal';
import TextWithIcon from '@/components/molecules/TextWithIcon';

interface Props {
  type: ButtonType;
  label: string;
  optionHeader: string;
  options: () => JSX.Element;
  Icon: FunctionComponent;
  onClick?: () => void;
  inputValue?: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  isShow: boolean;
  keys: string[];
}

const SearchFilter: FunctionComponent<Props> = ({
  type,
  label,
  optionHeader,
  options,
  Icon,
  onClick,
  isShow,
  inputValue,
  onChange,
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

      {isShow && (
        <FilterModal
          optionHeader={optionHeader}
          inputValue={inputValue}
          onChange={onChange}
          options={options}
          keys={keys}
        />
      )}
    </>
  );
};

export default SearchFilter;
