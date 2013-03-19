class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  before_filter :authenticate_user!
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
    @discussion = Discussion.new(params[:discussion])
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update

    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to discussions_path, notice: 'Discussion was successfully updated.' }
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
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

  def view_discussion
      @discussion = Discussion.find(params[:id])
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
   @user_discussion = UserDiscussion.new
   @user_discussion.discussion_id = params[:id]
   @user_discussion.user_id = current_user.id
   @user_discussion.save
   redirect_to  discussions_path
 end 


 def comments
  @user_profile = current_user.user_profile
  @discussion = Discussion.find(params[:id])
  @user_discussions = @discussion.joined_user.select{ |user| user if user != current_user  }
  @comments = @discussion.comments 
 end


 def show_user     
      @user_profile = UserProfile.find(params[:user_id])
      @discussion = Discussion.find(params[:id])

      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
      format.js
    end
  end 
end
