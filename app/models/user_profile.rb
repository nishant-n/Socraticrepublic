class UserProfile < ActiveRecord::Base
  attr_accessible :city, :county, :country, :first_name, :last_name, :latitude, :longitude, :physical_address, :postal_zip_code, :state, :unit_no
  attr_accessible :avatar
  has_attached_file :avatar,
   :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
   :url =>"/images/avatar/:id/:style/:filename",
   :default_url => "/images/:style/missing.png"
  belongs_to :user
end
