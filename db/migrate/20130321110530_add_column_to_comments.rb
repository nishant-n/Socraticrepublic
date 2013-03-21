class AddColumnToComments < ActiveRecord::Migration
  def self.up
       add_column :comments ,:user_discussion_id ,:integer
      
  end
    def self.down
      remove_column :comments ,:user_discussion_id 
     
  end
end
