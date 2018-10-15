class Size < ApplicationRecord
  belongs_to :product

  validates :size, presence: true, length: {maximum: 10}
  validates :price, presence: true, numericality: {greater_than: 0}
end
