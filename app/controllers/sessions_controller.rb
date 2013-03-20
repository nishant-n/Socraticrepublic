class SessionsController < Devise::SessionsController
	   def create
        
          user = User.find_by_email(params[:user][:email]) 
         unless user.nil? 
          sign_in :user, user 
          redirect_to ''
         else
           redirect_to :back, notice: "incorrect email id."
         end 

      end

  def update
  end

  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    redirect_to new_user_session_path
  end

 end 
