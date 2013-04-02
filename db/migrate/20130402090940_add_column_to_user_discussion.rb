class AddColumnToUserDiscussion < ActiveRecord::Migration
  def self.up
   	add_column :user_discussions ,:declaration_id,:integer
   	
  end
    def self.down
    remove_column :user_discussions ,:declaration_id
   	
  end
end
