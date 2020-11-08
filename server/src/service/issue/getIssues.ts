import Issue from '@models/issue';
import User from '@models/user';
import Comment from '@models/comment';
import Milestone from '@models/milestone';
import Label from '@models/label';
import { Op } from 'sequelize';

interface GetIssuesProps {
  author?: string;
  assignee?: string;
  milestone?: string;
  label?: string;
  userId: number;
  comment: boolean;
}

interface IssueWithLabels extends Issue {
  Labels: Label[];
}

const getIssues = async ({
  author,
  assignee,
  milestone,
  label,
  comment,
  userId,
}: GetIssuesProps) => {
  try {
    const commentWhereOptions = comment ? { user_id: userId } : undefined;
    const assigneeWhereOptions = assignee ? { email: assignee } : undefined;
    const authorWhereOptions = author ? { email: author } : undefined;
    const labelWhereOptions = label ? { name: { [Op.or]: label.split(',') } } : undefined;
    const milestoneWhereOptions = milestone ? { name: milestone } : undefined;

    const issues = (await Issue.findAll({
      attributes: ['id', 'title', 'content', 'is_open'],
      include: [
        {
          model: User,
          as: 'Assignee',
          attributes: ['id', 'email', 'name', 'profile'],
          where: assigneeWhereOptions,
          through: {
            attributes: [],
          },
        },
        {
          model: User,
          attributes: ['id', 'email', 'name', 'profile'],
          where: authorWhereOptions,
        },
        {
          model: Label,
          where: labelWhereOptions,
          through: {
            attributes: [],
          },
        },
        {
          model: Milestone,
          where: milestoneWhereOptions,
        },
        {
          model: Comment,
          where: commentWhereOptions,
        },
      ],
    })) as IssueWithLabels[];

    if (label) {
      return issues.filter((issue) => {
        const { Labels } = issue;
        const labelNames = Labels.map((currentLabel) => currentLabel.name);
        const hasAllLabels = label
          .split(',')
          .reduce(
            (hasLabels: boolean, currentLabel) => hasLabels && labelNames.includes(currentLabel),
            true,
          );

        return hasAllLabels;
      });
    }
    return issues;
  } catch (error) {
    console.error(error);
  }
};

export default getIssues;
