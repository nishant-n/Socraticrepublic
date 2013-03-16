class CreateUserDicussions < ActiveRecord::Migration
  def change
    create_table :user_dicussions do |t|
      t.references :discussion

      t.timestamps
    end
    add_index :user_dicussions, :discussion_id
  end
end
