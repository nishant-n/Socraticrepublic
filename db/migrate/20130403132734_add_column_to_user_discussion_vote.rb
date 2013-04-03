class AddColumnToUserDiscussionVote < ActiveRecord::Migration
  def self.up
   	add_column :user_discussion_votes ,:discussion_id 	,:integer
   	
  end
    def self.down
    remove_column :user_discussion_votes ,:discussion_id 	
   	
  end
end
