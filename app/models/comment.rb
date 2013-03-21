class Comment < ActiveRecord::Base
  attr_accessible :comments, :discussion_id, :user_id, :user_discussion_id
  belongs_to :user_discussion
  belongs_to :user
end
