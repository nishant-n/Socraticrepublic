class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
def index
	@user_profile = current_user.user_profile
	@users =User.all
	@user = User.new
end	


def create_user
 	@user = User.new(params[:user])
	@user.password="cisin@123"
	@user.build_user_profile
	@user.save
	redirect_to users_path 
end	


def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end

