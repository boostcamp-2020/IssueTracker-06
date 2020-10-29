import Label from '@models/label';

interface LabelProps {
  name: string;
  description?: string;
  color: string;
}

const createLabel = async (label: LabelProps) => {
  try {
    const createdLabel = await Label.create(label);
    return createdLabel.id;
  } catch (error) {
    console.error(error);
  }
};

export default createLabel;
