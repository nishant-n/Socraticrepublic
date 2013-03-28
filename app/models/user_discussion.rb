class UserDiscussion < ActiveRecord::Base
  attr_accessible :discussion_id, :user_id,:argument, :thesis
  belongs_to :discussion
  belongs_to :user
  has_one :comment
  has_one :vote
end
