class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password

  belongs_to :role
  has_many :stores, dependent: :destroy
  has_one :shipper, dependent: :destroy
  has_many :shipper_orders, through: :shipper
  has_one :image, as: :media, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :products_cart,through: :carts, source: :product
  has_many :devices, dependent: :destroy

  accepts_nested_attributes_for :shipper, update_only: true, allow_destroy: true

  validates :email, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length},
    format: {with: Settings.validations.email_regex}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length}, allow_nil: true
  validates :name, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length}
  validates :phone, format: {with: Settings.validations.phone_regex}, if: :phone?
  validates :address, length: {minimum: 10, maximum: 1000}, if: :address?
end
