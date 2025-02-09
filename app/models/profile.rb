class Profile < ApplicationRecord
  belongs_to :user
  has_many :educations, dependent: :destroy
  accepts_nested_attributes_for :educations, allow_destroy: true
end
