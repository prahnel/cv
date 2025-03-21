class Cv < ApplicationRecord
  belongs_to :user
  has_one :basic_information, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :work_experiences, dependent: :destroy

  accepts_nested_attributes_for :basic_information, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :work_experiences, allow_destroy: true
end
