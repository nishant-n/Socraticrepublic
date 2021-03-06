class DeclarationsController < ApplicationController
	

  def create_declaration
  	@declaration=Declaration.new
	  @declaration.name = params[:declaration][:name]
	  @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:discussion_id],current_user.id)
    @declaration.user_discussion_id=@user_discussion.id
      respond_to do |format|
      if @declaration.save
          format.html { redirect_to :back, notice: 'Declaration  successfully created.' }
      end
    end 
     
  end

  def new
    @declaration=Declaration.new
    @discussion = Discussion.find(params[:discussion_id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end 
  end
  def edit
    
    @declaration= Declaration.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @declaration=Declaration.find(params[:id])
    @declaration.user_discussion_id = @declaration.user_discussion.id
    @votes= @declaration.votes
    @votes.each do |vote|
      vote.destroy
    end
    respond_to do |format|
        if @declaration.update_attributes(params[:declaration])
          
          format.html { redirect_to :back, notice: 'Declaration was successfully updated.' }  
        end
    end 
  end
end