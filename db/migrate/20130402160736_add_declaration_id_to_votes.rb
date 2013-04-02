class AddDeclarationIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :declaration_id, :integer
  end
end
