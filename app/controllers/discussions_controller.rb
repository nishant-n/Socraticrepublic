class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  before_filter :authenticate_user!
   load_and_authorize_resource :only => [:index, :show,:comments,:destroy]
  def index
   
    @user_profile = current_user.user_profile
    @discussions = current_user.joined_discussions
   
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])
    @user=User.find(params[:user_id])
    @user_profile=@user.user_profile

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussions = Discussion.all
    @discussion = Discussion.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussions = Discussion.all
    @discussion = current_user.discussions.new(params[:discussion])
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to new_discussion_path, notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
     else
        format.html { redirect_to new_discussion_path, notice: 'Name and Determination Cant be Null .' }
        format.json {  }
      end
    end
  
        
   
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])
    respond_to do |format|
      if current_user.user_discussions.find_by_discussion_id(params[:id]).update_attributes(params[:user_discussion])
        format.html { redirect_to discussions_path, notice: 'Thesis and Argument was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to  new_discussion_url }
      format.json { head :no_content }
    end
  end

  def view_discussion
      @user_discussion = current_user.user_discussions.find_by_discussion_id(params[:id].to_i)
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
      format.js
    end
  end

  def add_discussion
      @discussion = Discussion.new
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
      format.js
    end 
  end  

 def add_my_topic
         @discussion = Discussion.find_by_id(params[:id])
     if !@discussion.blank? && @discussion.joined_user.size < 18
         @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:id],current_user.id)
         unless !@user_discussion.blank?
          @user_discussion = UserDiscussion.create(:discussion_id=>params[:id],:user_id=>current_user.id)
          @message = "You have added the discussion ."
         else
          @message = "You have already added the discussion ." 
         end
         @discussion.update!
         redirect_to  discussions_path, notice:  @message
     else 
        redirect_to :back , notice: "User could not be added the discussion."
     end
 end 


 def comments
    @user_profile = current_user.user_profile
    @discussion = Discussion.find(params[:id])
    @user_discussion = current_user.user_discussions.find_by_discussion_id(params[:id].to_i)
    @user_discussions = @discussion.joined_user.select{ |user| user if user != current_user  }
    @comments = @discussion.comments 
 end


 def show_user 
      @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:id],params[:user_id]) 
      @discussion = @user_discussion.discussion
      @user = @user_discussion.user   
      @user_profile = @user.user_profile 
      @user_comments = @user_discussion.comments
      @comment = Comment.find_by_user_id_and_user_discussion_id(current_user.id,@user_discussion[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_discussion.discussion }
      format.js
    end
  end 

  def view_user_comments
    debugger
    @user_comments = Comment.where("user_id = ? and user_discussion_id =?", current_user,params[:id])
  end


  def show_user_discussion
    @discussion = Discussion.find_by_id(params[:id])
    @user = User.find(params[:user_id])    
    @user_discussion = @user.user_discussions.find_by_discussion_id(params[:id])
    end

  def destroy_user_discussion
    @user_discussion=current_user.user_discussions.find_by_discussion_id(params[:id])
    @user_discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

   def votes
    @vote=Vote.new
    @user_profile = current_user.user_profile
    @discussion = Discussion.find(params[:id])
    @discussion_user = UserDiscussion.where("discussion_id =?", @discussion)
    @discussion_vote=@discussion_user.map{|du|du.vote}.compact
    @user_discussion = UserDiscussion.find_by_discussion_id_and_user_id(params[:id],current_user.id)
  end



end
