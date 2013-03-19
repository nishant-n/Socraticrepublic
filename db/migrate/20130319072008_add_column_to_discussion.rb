class AddColumnToDiscussion < ActiveRecord::Migration
  def self.up
   	add_column :discussions ,:name ,:string
   	add_column :discussions ,:determination ,:string
   	add_column :discussions ,:origin ,:string, :default => "state"
   	add_column :discussions ,:level ,:integer, :default => 0
   	add_column :discussions ,:base_fourms ,:string, :default => 0
   end	
  def self.down
    add_column :discussions ,:name 
   	add_column :discussions ,:determination 
   	add_column :discussions ,:origin ,:string
   	add_column :discussions ,:level ,:integer
   	add_column :discussions ,:base_fourms ,:string 
  end
end
