class AddColumnToVote < ActiveRecord::Migration
  def self.up
   	add_column :votes ,:user_discussion_id ,:integer
   	add_column :votes ,:favour ,:boolean
   	add_column :votes ,:against ,:boolean
  end
    def self.down
   	remove_column :votes ,:user_discussion_id
   	remove_column :votes ,:favour
   	remove_column :votes ,:against
  end
end
