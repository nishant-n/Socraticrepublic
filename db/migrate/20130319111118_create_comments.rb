class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.integer :user_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
