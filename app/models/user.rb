class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :educations, through: :profile
  accepts_nested_attributes_for :profile

  after_create :create_profile #Profile created when User registers

  def create_profile
    Profile.create(user: self)
  end

end
