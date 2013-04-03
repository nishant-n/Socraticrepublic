class Declaration < ActiveRecord::Base
  belongs_to  :user_discussion
  has_many :votes
   attr_accessible :name
  
end
