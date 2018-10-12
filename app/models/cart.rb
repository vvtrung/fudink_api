class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :customer, class_name: User.name, foreign_key: :user_id

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
end
