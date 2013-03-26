class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :favour, :against
  validates_uniqueness_of :user_discussion_id
  belongs_to :user_discussion

  def self.getFavour(userdiscussion)
   	where("favour = ? and user_discussion_id =?", 1,userdiscussion.id).count
  end

  def self.getAgainst(userdiscussion)
    where("against = ? and user_discussion_id =?", 1,userdiscussion.id).count
  end 
 end

