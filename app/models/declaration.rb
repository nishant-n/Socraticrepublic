class Declaration < ActiveRecord::Base
  belongs_to :discussion
  # attr_accessible :title, :body
  validates :discussion_id  ,:uniqueness => true
end
