import React, { FunctionComponent } from 'react';
import Button, { ButtonType } from '@components/atoms/Button';
import FilterModal from '@components/molecules/SelectMenuModal';
import TextWithIcon from '@/components/molecules/TextWithIcon';

interface Props {
  type: ButtonType;
  label: string;
  optionHeader: string;
  children: React.ReactChild | React.ReactChild[];
  Icon: FunctionComponent;
  onClick?: () => void;
  inputValue?: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  isShow: boolean;
}

const SearchFilter: FunctionComponent<Props> = ({
  type,
  label,
  optionHeader,
  Icon,
  onClick,
  isShow,
  inputValue,
  onChange,
  children,
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
        >
          {children}
        </FilterModal>
      )}
    </>
  );
};

export default SearchFilter;
