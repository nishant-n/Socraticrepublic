class AddUserIdToDeclaration < ActiveRecord::Migration
  def self.up
   	add_column :declarations ,:user_id ,:integer
  end
    def self.down
   	remove_column :declarations ,:user_id 
  end
end
