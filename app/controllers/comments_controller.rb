class CommentsController < ApplicationController

  before_filter :authenticate_user!
  def create

      comment = current_user.comments.build(params[:user_discussion][:comments])
      
      respond_to do |format|
      if comment.save            
       format.html { redirect_to  discussions_path, notice: 'successfully comment created.' }
       
      else
        format.html { redirect_to  discussions_path}

       end       
     end
   end
end
