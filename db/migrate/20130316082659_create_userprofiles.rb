class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :physical_address
      t.integer :unit_no
      t.integer :postal_zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
