class CommentsController < ApplicationController
  def create
      @discussion = Discussion.find(params[:id])
      @comment = @discussion.comments.create(:comments => params[:comment][:comments],:user_id => current_user.id)
      respond_to do |format|
      if @comment.save
            
       format.html { redirect_to  discussions_path, notice: 'successfully comment created.' }
       format.json { render json: discussions_path, status: :created, location: discussion_path(@discussion) }
      else
        format.html { redirect_to  discussions_path}
        format.json { render json: discussions_path.errors, status: :unprocessable_entity }
       end       
     end
   end
end
