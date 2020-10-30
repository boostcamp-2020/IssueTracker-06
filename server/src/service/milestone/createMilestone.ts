import Milestone from '@models/milestone';

interface MilestoneProps {
  name: string;
  date: string;
  description?: string;
}

const craeteMilestone = async (milestone: MilestoneProps) => {
  try {
    const createdMilestone = await Milestone.create({ ...milestone, is_open: true });
    return createdMilestone.id;
  } catch (error) {
    console.error(error);
  }
};

export default craeteMilestone;
