class UsersController < ApplicationController
def index
	@users =User.all
	@user = User.new
end	
def create

end

def create_user

	@user = User.new(params[:user])
	@user.password="cisin@123"
	@user.build_userprofile
	@user.save
	redirect_to users_path

end	
end

