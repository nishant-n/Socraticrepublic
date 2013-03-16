class Discussion < ActiveRecord::Base
  attr_accessible :deleted_at, :description, :location, :title
  has_many :user_dicussions
end
