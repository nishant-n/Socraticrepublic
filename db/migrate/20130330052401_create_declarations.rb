class CreateDeclarations < ActiveRecord::Migration
  def change
    create_table :declarations do |t|
      t.string :name	
      t.references :discussion
      
      t.timestamps
    end
    add_index :declarations, :discussion_id
  end

  def down
  	drop_table :declarations
  end
  
end
