import Milestone from '@models/milestone';

const deleteMilestone = async (milestoneId: number) => {
  try {
    await Milestone.destroy({ where: { id: milestoneId } });
    return true;
  } catch (error) {
    console.error(error);
  }
};

export default deleteMilestone;
