class Userprofile < ActiveRecord::Base
  attr_accessible :city, :country, :first_name, :last_name, :physical_address, :postal_zip_code, :unit_no
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
  belongs_to :user
end
