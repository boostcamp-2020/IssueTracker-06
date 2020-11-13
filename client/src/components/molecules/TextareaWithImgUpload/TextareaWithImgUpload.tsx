/* eslint-disable jsx-a11y/click-events-have-key-events */
/* eslint-disable jsx-a11y/no-static-element-interactions */
import React, {
  ChangeEvent,
  FunctionComponent,
  useCallback,
  useRef,
} from 'react';

import styled from '@themes/styled';
import Textarea from '@components/atoms/TextArea';

interface Props {
  value: string;
  onChange: (e: ChangeEvent<HTMLTextAreaElement>) => void;
}

const StyledTextareaWithImgUpload = styled.div`
  margin: 8px 12px;
  background-color: ${({ theme }) => theme.palette.BG_COLOR01};

  & > textarea {
    box-sizing: border-box;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
  }

  & > .image-upload {
    padding: 8px;
    font-size: 0.5rem;
    color: ${({ theme }) => theme.palette.SECONDARY};
    border-top: 1px dashed ${({ theme }) => theme.palette.BORDER_COLOR};
    border-bottom-left-radius: 0.5rem;
    border-bottom-right-radius: 0.5rem;
    cursor: pointer;
  }
`;

const TextareaWithImgUpload: FunctionComponent<Props> = ({
  value,
  onChange,
}) => {
  const uploadRef = useRef<HTMLInputElement>(null);

  const onClickUpload = useCallback(() => {
    if (uploadRef.current) {
      uploadRef.current.click();
    }
  }, [uploadRef.current]);

  return (
    <StyledTextareaWithImgUpload>
      <input type="file" ref={uploadRef} hidden />
      <Textarea
        textAreaWidth="100%"
        textAreaHeight="200px"
        placeHolder="Leave a comment"
        value={value}
        onChange={onChange}
      />
      <div className="image-upload" onClick={onClickUpload}>
        Attach files by selecting here
      </div>
    </StyledTextareaWithImgUpload>
  );
};

export default TextareaWithImgUpload;
