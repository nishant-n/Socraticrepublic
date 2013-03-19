class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :physical_address
      t.string :unit_no
      t.string :postal_zip_code
      t.string :city
      t.string :county
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
