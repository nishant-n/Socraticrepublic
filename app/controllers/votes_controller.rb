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
		    format.html { redirect_to :back, notice: 'Vote was successfully created.' }
		   end
          end
       else
     	  @vote.check_vote(params[:vote]) 
     	  redirect_to votes_discussion_path(@userdiscussion.discussion), notice: 'Vote successfully upadated .'
       end	
   end  
end
