import Label from '@models/label';

interface UpdatedLabel {
  id: number;
  name?: string;
  description?: string;
  color?: string;
}

const updateLabel = async (updatedLabel: UpdatedLabel) => {
  try {
    const { id, name, description, color } = updatedLabel;
    await Label.update({ name, description, color }, { where: { id } });

    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateLabel;
