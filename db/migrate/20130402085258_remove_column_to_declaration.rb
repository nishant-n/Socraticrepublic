class RemoveColumnToDeclaration < ActiveRecord::Migration
  def self.up
   	add_column :declarations ,:user_discussion_id,:integer
   	remove_column :declarations ,:user_id 
   	remove_column :declarations ,:discussion_id 
  end
    def self.down
    remove_column :declarations ,:user_discussion_id
   	add_column :declarations ,:user_id ,:integer
   	add_column :declarations ,:discussion_id ,:integer
  end
end
