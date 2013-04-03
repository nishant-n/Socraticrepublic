class RemoveUserIdFromDeclarations < ActiveRecord::Migration
  def self.up	
   	remove_column :declarations ,:user_id  	
  end
  def self.down
   	add_column :declarations ,:user_id ,:integer
  end
end
