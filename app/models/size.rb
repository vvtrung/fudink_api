class Size < ApplicationRecord
  belongs_to :product

  validates :size, presence: true, length: {
    maximum: Settings.validations.strings.normal_length}
  validates :price, presence: true, numericality: {greater_than: 0}
end
