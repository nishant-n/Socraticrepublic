class Discussion < ActiveRecord::Base
  attr_accessible :argument, :thesis, :determination, :name, :origin,:level,:base_fourms
  has_many :user_discussions
  belongs_to :user
  has_many :joined_user,:through=>:user_discussions ,:source =>:user
  has_many :comments
  has_many  :declarations
  has_many :user_discussion_votes
  validates :name, :presence => true 
                    

  validates :determination, :presence => true
                    

  def update!
  	 update_attributes(:level => 1, :base_fourms=>1)
  end	

end
