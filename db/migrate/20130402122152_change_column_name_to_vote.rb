class ChangeColumnNameToVote < ActiveRecord::Migration
   def self.up
    rename_column :votes, :user_discussion_id, :user_id
  end

  def self.down
  	 rename_column :votes, :user_id, :user_discussion_id
    # rename back if you need or do something else or do nothing
  end
end
