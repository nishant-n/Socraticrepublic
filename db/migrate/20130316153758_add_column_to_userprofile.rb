class AddColumnToUserprofile < ActiveRecord::Migration
   def self.up
   	add_column :userprofiles ,:user_id ,:integer
  end
    def self.down
   	remove_column :userprofiles ,:user_id 
  end
end
