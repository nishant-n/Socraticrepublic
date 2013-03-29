class ApplicationController < ActionController::Base
  protect_from_forgery
   rescue_from CanCan::AccessDenied do |exception|
  		flash[:notice] = "Access Denied"
		redirect_to user_profile_path(current_user) 
		return false
    end

	
end
