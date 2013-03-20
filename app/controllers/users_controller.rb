class UsersController < ApplicationController
	before_filter :authenticate_user!
def index
	@user_profile = current_user.user_profile
	@users =User.all
	@user = User.new
end	
def create
	

end

def create_user
  
	@user = User.new(params[:user])
	@user.password="cisin@123"
	@user.build_user_profile
	@user.save
	redirect_to users_path 
	

end	
end

