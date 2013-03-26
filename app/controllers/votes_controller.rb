class VotesController < ApplicationController

	def get_votes

		@userdiscussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:discussion_id],current_user.id)
        @check=Vote.where(:user_discussion_id=>@userdiscussion.id).present?	
        unless @check
		@vote=Vote.new
		if params[:vote] == "1"
			@vote.favour=1
			@vote.against=0
	    else	
	     	@vote.favour=0
			@vote.against=1
	    end		
		@vote.user_discussion_id = @userdiscussion.id
	    respond_to do |format|
        if @vote.save
          format.html { redirect_to :back, notice: 'Vote was successfully created.' }
        end
      end
     else

    	redirect_to comments_discussion_path(@userdiscussion.discussion),notice: 'Already Voted .'
     end	
   end  
end
