class Shipper < ApplicationRecord
  belongs_to :user
  has_many :shipper_orders, dependent: :destroy

  enum status: %i(off ready block)
end
