class Comment < ActiveRecord::Base
  attr_accessible :comments, :discussion_id, :user_id, :user_discussion_id
  belongs_to :user_discussion
  belongs_to :user
  validates :user_id,:uniqueness => { :scope => :user_discussion_id}
end
