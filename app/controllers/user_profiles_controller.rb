class UserProfilesController < ApplicationController
  # GET /user_profiles
  # GET /user_profiles.json
  before_filter :authenticate_user!
  load_and_authorize_resource :only => [:edit]
  def index
    @user_profile = UserProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    
    unless current_user.user_profile.blank?
    @user_profile = current_user.user_profile
   else
    user = current_user.build_user_profile
    user.save
    @user_profile = current_user.user_profile
  end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_profile }
    end
   
  end

  # GET /user_profiles/new
  # GET /user_profiles/new.json
  def new
    @user_profile = UserProfile.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_profile }
    end
  end

  # GET /user_profiles/1/edit
  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(params[:user_profile])
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice:'User profile was successfully created.' }
        format.json { render json: @user_profile, status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.json
  def update
    @user_profile = UserProfile.find(params[:id])
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy
      respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end
end
