import Milestone from '@models/milestone';

const getMilestones = async () => {
  try {
    const milestones = await Milestone.findAll();

    return milestones;
  } catch (error) {
    console.error(error);
  }
};

export default getMilestones;
