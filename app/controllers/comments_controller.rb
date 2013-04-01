class CommentsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource :only => [:edit]
  def create
      @comment = current_user.comments.build(params[:user_discussion][:comments])
         respond_to do |format|
      if @comment.save            
       format.html { redirect_to  :back, notice: 'successfully comment created.' }
       
       format.js
      else
        format.html { redirect_to  discussions_path}
       end       
     end
   end

   def edit
     @comment=Comment.find(params[:id])
   end

   def update

      @comment=Comment.find(params[:id])
      @comment.user_id=@comment.user.id
      @comment.user_discussion_id=@comment.user_discussion.id
      respond_to do |format|
        if @comment.update_attributes(params[:comment])
          format.html { redirect_to :back, notice: 'Comment was successfully updated.' }
          format.js
        end
      end 
    end
end
