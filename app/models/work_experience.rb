class WorkExperience < ApplicationRecord
  belongs_to :cv

  validates :company, presence: true
  validates :position, presence: true

end
