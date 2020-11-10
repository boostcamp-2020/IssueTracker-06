import React, { FunctionComponent } from 'react';
import styled from '@themes/styled';

interface Props {
  content: React.ReactChild;
}

const List: FunctionComponent<Props> = ({ content }) => <li>{content}</li>;

export default List;
