class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_one :user_profile
  has_many :user_discussions
  has_many :discussions
  has_many :joined_discussions,:through=>:user_discussions,:source => :discussion
  has_many :comments
  has_many :declarations
  def assign_default_role
    
    add_role(:user)
  end
  
end
