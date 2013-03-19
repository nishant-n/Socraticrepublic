class RemoveUserIdFromDiscussions < ActiveRecord::Migration
  def up
    remove_column :discussions, :user_id
  end

  def down
    add_column :discussions, :user_id, :integer
  end
end
