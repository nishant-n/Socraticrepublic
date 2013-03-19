class CreateUserDiscussions < ActiveRecord::Migration
  def change
    create_table :user_discussions do |t|
      t.integer :user_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
