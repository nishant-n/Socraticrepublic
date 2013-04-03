class CreateUserDiscussionVotes < ActiveRecord::Migration
  def change
    create_table :user_discussion_votes do |t|
      t.integer :user_discussion_id
      t.integer :voter_id

      t.timestamps
    end
  end
end
