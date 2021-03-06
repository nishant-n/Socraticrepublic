class UserDiscussion < ActiveRecord::Base
  attr_accessible :discussion_id, :user_id,:argument, :thesis
  belongs_to :discussion
  belongs_to :user
  has_many :comments
  has_one :vote
  has_many :comments
  has_many  :declarations
  has_many :user_discussion_votes
end
