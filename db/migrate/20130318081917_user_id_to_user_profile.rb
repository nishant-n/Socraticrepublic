class UserIdToUserProfile < ActiveRecord::Migration
  def up
    	add_column :user_profiles ,:user_id ,:integer
   end

  def down
  	remove_column :user_profiles ,:user_id 
  end
end
