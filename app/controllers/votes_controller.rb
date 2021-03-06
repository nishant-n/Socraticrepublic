class VotesController < ApplicationController
    
    def get_votes 
      @user_vote=params[:vote]
      @user_vote.each do |dec_id,vote|
          @vote = Vote.find_by_user_id_and_declaration_id(current_user,dec_id)
          unless @vote 
            inv_vote=vote.eql?("true")? false:true
            @vote=Vote.new(:favour=>vote,:against=>inv_vote,:declaration_id=>dec_id,:user_id=>current_user.id)
            @vote.save
          else
             if vote == "true"
                @vote.update_attributes(:favour => true,:against => false)  
            else      
                @vote.update_attributes(:against => true ,:favour => false) 
             end
          end  
      end
      redirect_to :back, notice: 'Vote  successfully created.'
    end
  
    def new
      @vote=Vote.new
      @user_profile = current_user.user_profile
      @discussion = Discussion.find(params[:discussion_id])
      #@discussion_user = UserDiscussion.where("discussion_id =?", @discussion)
      #@discussion_vote=@discussion_user.map{|du|du.vote}.compact
      @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:discussion_id],current_user.id)
      @user_declaration=Declaration.joins(:user_discussion).where("user_discussions.discussion_id=?",@discussion.id)
    end


   def post_user_vote
   
   @user_discussion_vote = UserDiscussionVote.find_by_voter_id_and_discussion_id(current_user.id,params[:discussion_id])
   unless @user_discussion_vote 
       @user_discussion_vote =UserDiscussionVote.new("user_discussion_id" => params[:user_discussion_id],"voter_id" => current_user.id,
       "discussion_id"=>params[:discussion_id])
       @user_discussion_vote.save
     else
       @user_discussion_vote.update_attributes(:user_discussion_id=>params[:user_discussion_id],"voter_id" => current_user.id,"discussion_id"=>params[:discussion_id])
   end 

     redirect_to :back, notice: 'Vote successfully created.'
   end 

   

  
end
