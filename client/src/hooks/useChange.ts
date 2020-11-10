import { useCallback, useState } from 'react';

export default <T extends { value: string }>(
  initState: string,
): [
  string,
  React.Dispatch<React.SetStateAction<string>>,
  (e: React.ChangeEvent<T>) => void,
] => {
  const [value, setValue] = useState(initState);

  const onChange = useCallback((e: React.ChangeEvent<T>) => {
    setValue(e.target.value);
  }, []);

  return [value, setValue, onChange];
};
