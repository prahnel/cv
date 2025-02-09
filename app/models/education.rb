class Education < ApplicationRecord
  belongs_to :profile
  validates :institution, :degree, presence: true
end
