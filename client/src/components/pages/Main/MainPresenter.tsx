import React, { FunctionComponent } from 'react';

import styled from '@themes/styled';
import AppLayout from '@components/organisms/AppLayout';

const StyledMainSection = styled.section`
  width: 1200px;
  margin: 60px auto;
`;

const MainPresenter: FunctionComponent = () => (
  <AppLayout>
    <StyledMainSection>test</StyledMainSection>
  </AppLayout>
);

export default MainPresenter;
