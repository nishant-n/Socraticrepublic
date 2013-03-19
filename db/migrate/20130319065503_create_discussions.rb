class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :thesis
      t.text :argument
      t.integer :user_id

      t.timestamps
    end
  end
end
