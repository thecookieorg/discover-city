class User < ActiveRecord::Base
  
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_pic, ProfilePicUploader
  
  validates_uniqueness_of :username
         
  #has_many :phones
  has_many :restaurants
end
