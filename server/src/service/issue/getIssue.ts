import Issue from '@models/issue';
import User from '@models/user';
import Comment from '@models/comment';
import Milestone from '@models/milestone';
import Label from '@models/label';

const getIssue = async (issueId: number) => {
  try {
    const issue = await Issue.findOne({
      where: { id: issueId },
      attributes: ['id', 'title', 'content', 'is_open'],
      include: [
        {
          model: User,
          attributes: ['id', 'email', 'name', 'profile'],
        },
        {
          model: Comment,
          attributes: ['id', 'content', 'created_at', 'updated_at'],
          include: [
            {
              model: User,
              attributes: ['id', 'email', 'name', 'profile'],
            },
          ],
        },
        {
          model: Milestone,
        },
        {
          model: Label,
        },
      ],
    });

    return issue;
  } catch (error) {
    console.error(error);
  }
};

export default getIssue;
