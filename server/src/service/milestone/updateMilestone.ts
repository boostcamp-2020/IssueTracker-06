import Milestone from '@models/milestone';

interface MilestoneProps {
  id: number;
  name?: string;
  date?: Date;
  description?: string;
  isOpen?: boolean;
}

const updateMilestone = async (milestone: MilestoneProps) => {
  try {
    const { id, name, date, description } = milestone;
    await Milestone.update({ name, date, description }, { where: { id } });

    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateMilestone;
