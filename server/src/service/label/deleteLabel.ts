import Label from '@models/label';

const deleteLabel = async (labelId: number) => {
  try {
    await Label.destroy({ where: { id: labelId } });

    return true;
  } catch (error) {
    console.error(error);
  }
};

export default deleteLabel;
