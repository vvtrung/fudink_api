class Order < ApplicationRecord
  belongs_to :store
  belongs_to :customer, class_name: User.name, foreign_key: :user_id
  has_many :detail_orders, dependent: :destroy
  has_many :shipper_orders, dependent: :destroy

  enum status: %i(pending accepted rejected)

  validates :phone, presence: true, format: {with: Settings.validations.phone_regex}
  validates :address, presence: true, length: {
    minimum: Settings.validations.text.min_length,
    maximum: Settings.validations.text.max_length}
end
