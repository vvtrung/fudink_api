class Order < ApplicationRecord
  belongs_to :store
  belongs_to :customer, class_name: User.name, foreign_key: :user_id
  has_many :detail_orders, dependent: :destroy
  has_many :shipper_orders, dependent: :destroy

  enum status: %i(pending accepted rejected)
end
