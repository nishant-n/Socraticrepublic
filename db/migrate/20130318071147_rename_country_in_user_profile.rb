class RenameCountryInUserProfile < ActiveRecord::Migration
  def up
    rename_column :userprofiles, :country, :county
  end

  def down
  	rename_column :userprofiles, :county, :country
  end
end
