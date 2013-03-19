class AddColumnToUserProfile < ActiveRecord::Migration
  def self.up
   	add_column :user_profiles ,:country ,:string
  end
    def self.down
   	remove_column :user_profiles ,:country 
  end
end
