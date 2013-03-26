class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :favour, :against
  validates_uniqueness_of :user_discussion_id
  belongs_to :user_discussion

  def self.getFavour(userdiscussion)
   	Vote.where("favour = ? and user_discussion_id =?", 1,userdiscussion.id).count
  end

  def self.getAgainst(userdiscussion)
  	Vote.where("against = ? and user_discussion_id =?", 1,userdiscussion.id).count
  end 
 end

