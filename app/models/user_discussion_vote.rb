class UserDiscussionVote < ActiveRecord::Base
  attr_accessible :user_discussion_id, :voter_id, :discussion_id
  belongs_to :user_discussion
  belongs_to :discussion
end
