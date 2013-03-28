class AddColumnToVote < ActiveRecord::Migration
  def self.up
   	add_column :votes ,:user_discussion_id ,:integer
   	add_column :votes ,:favour ,:boolean, :default => false
   	add_column :votes ,:against ,:boolean, :default => false
  end
    def self.down
   	remove_column :votes ,:user_discussion_id
   	remove_column :votes ,:favour
   	remove_column :votes ,:against
  end
end
