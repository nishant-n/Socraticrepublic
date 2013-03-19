class Discussion < ActiveRecord::Base
  attr_accessible :argument, :thesis, :determination, :name, :origin,:level,:base_fourms
  has_many :user_discussions
  belongs_to :user
  has_many :joined_user,:through=>:user_discussions ,:source =>:user
  has_many :comments
  belongs_to :user
end
