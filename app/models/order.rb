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
  validate :address_not_found
  validate :cant_back_status, if: :id?

  scope :lastest, ->{order(created_at: :desc)}

  def address_not_found
    return if ship_cost.present?
    errors.add :address, :invalid
  end

  def cant_back_status
    order = Order.find_by! id: id
    return if order.pending?
    errors.add :status, "Not allowed to update"
  end
end
