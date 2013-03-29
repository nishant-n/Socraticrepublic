class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :favour, :against
  validates_uniqueness_of :user_discussion_id
  belongs_to :user_discussion

   def self.getFavour(discussion_vote)
    discussionvote=discussion_vote.compact
    discussionvote.map{|v|v if v.favour.equal?true}.compact.size
  end

  def self.getAgainst(discussion_vote)
    discussionVote=discussion_vote.compact
    discussionVote.map{|v|v if v.against.equal?true}.compact.size
  end 

  def check_vote(vot)
     if vot == "0"
        update_attributes(:favour => false,:against => true)  
     else        
        update_attributes(:against => false ,:favour => true) 
     end
  end
 end

