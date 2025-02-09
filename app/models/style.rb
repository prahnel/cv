class Style < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :font_family, presence: true
  validates :heading_color, presence: true
  validates :text_color, presence: true
  validates :font_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
