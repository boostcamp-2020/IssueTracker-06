import React, { FunctionComponent, useCallback, useState } from 'react';

import styled from '@themes/styled';
import Button from '@components/atoms/Button';
import { SettingIcon } from '@components/atoms/icons';

interface Props {
  title: string;
  emptyMessage?: string;
  children?: React.ReactChild;
  optionHeader: string;
  keys: string[];
  options: string[];
}

const StyledIssueSelectForm = styled.div`
  color: ${({ theme }) => theme.palette.SECONDARY};
  & > button {
    height: 30px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0;
    margin: 8px 0;
    color: currentColor;

    & > span {
      font-weight: 600;
    }

    & > svg {
      position: relative;
      width: 16px;
      fill: currentColor;
    }

    &:hover {
      color: ${({ theme }) => theme.palette.LINK_BLUE};
    }
  }

  & span {
    font-size: 0.8rem;
  }

  & > hr {
    width: 100%;
    border: 0.5px solid ${({ theme }) => theme.palette.BG_COLOR03};
    margin-top: 16px;
  }
`;

const IssueSelectForm: FunctionComponent<Props> = ({
  title,
  emptyMessage = '',
  children,
}) => {
  const [isOptionOpened, setIsOptionOpened] = useState(false);

  const onClickSetting = useCallback(() => {
    setIsOptionOpened(!isOptionOpened);
  }, [isOptionOpened]);

  return (
    <StyledIssueSelectForm>
      <Button type="transparent" onClick={onClickSetting}>
        <>
          <span>{title}</span>
          <SettingIcon />
        </>
      </Button>
      {children ? { children } : <span>{emptyMessage}</span>}
      <hr />
    </StyledIssueSelectForm>
  );
};

export default IssueSelectForm;
