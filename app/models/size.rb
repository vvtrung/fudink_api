class Size < ApplicationRecord
  belongs_to :product

  validates :size, present: true, length: {max_length: 10}
  validates :price, presence: true, numericality: {greater_than: 0}
end
