import Label from '@models/label';

const getLabels = async () => {
  try {
    const labels = await Label.findAll();

    return labels;
  } catch (error) {
    console.error(error);
  }
};

export default getLabels;
