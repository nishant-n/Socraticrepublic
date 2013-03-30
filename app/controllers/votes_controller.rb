class VotesController < ApplicationController
   def get_votes
	  @userdiscussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:discussion_id],current_user.id)   
      @vote = Vote.find( :first ,:conditions =>  ["user_discussion_id = ? ", @userdiscussion.id ])
      unless @vote.present?
		@vote=Vote.new
		if params[:vote] == "1"
			@vote.favour = true
			@vote.against = false
		else	
		    @vote.favour = false
			@vote.against = true
		end		
		@vote.user_discussion_id = @userdiscussion.id
		respond_to do |format|
		  if @vote.save
		    format.html { redirect_to :back, notice: 'Vote  successfully created.' }
		   end
          end
       else
     	  @vote.check_vote(params[:vote]) 
     	  redirect_to votes_discussion_path(@userdiscussion.discussion), notice: 'Vote successfully updated .'
       end	
   end 

    def new
      @vote=Vote.new
      @user_profile = current_user.user_profile
      @discussion = Discussion.find(params[:discussion_id])
      @discussion_user = UserDiscussion.where("discussion_id =?", @discussion)
      @discussion_vote=@discussion_user.map{|du|du.vote}.compact
      @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:discussion_id],current_user.id)
    	
   end 
end
