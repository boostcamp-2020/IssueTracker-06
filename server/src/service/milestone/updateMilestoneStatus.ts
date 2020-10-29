import Milestone from '@models/milestone';

interface MilestoneProps {
  id: number;
  name?: string;
  date?: Date;
  description?: string;
  isOpen?: boolean;
}

const updateMilestoneStatus = async (milestone: MilestoneProps) => {
  try {
    const { id, isOpen } = milestone;
    await Milestone.update({ is_open: isOpen }, { where: { id } });

    return true;
  } catch (error) {
    console.error(error);
  }
};

export default updateMilestoneStatus;
