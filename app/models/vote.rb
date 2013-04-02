class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :favour, :against,:declaration_id, :user_id
  
  belongs_to :user_discussion

   def self.getFavour(discussion_vote)
    discussionvote=discussion_vote.votes
    discussionvote.map{|v|v if v.favour.equal?true}.compact.size
  end

  def self.getAgainst(discussion_vote)
    discussionVote=discussion_vote.votes
    discussionVote.map{|v|v if v.against.equal?true}.compact.size
  end 

 
 end

