class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.string :description
      t.string :location
      t.date :deleted_at

      t.timestamps
    end
  end
end
