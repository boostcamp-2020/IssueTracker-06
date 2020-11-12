import { useCallback, useState } from 'react';

export default (): [
  boolean,
  React.Dispatch<React.SetStateAction<boolean>>,
  () => void,
] => {
  const [display, setDisplay] = useState(false);

  const onClick = useCallback(() => {
    setDisplay(!display);
  }, [display]);

  return [display, setDisplay, onClick];
};
