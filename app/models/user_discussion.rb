class UserDiscussion < ActiveRecord::Base
  attr_accessible :discussion_id, :user_id
  belongs_to :discussion
  belongs_to :user

end
