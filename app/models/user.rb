class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password

  belongs_to :role
  has_many :stores, dependent: :destroy
  has_one :shipper, dependent: :destroy
  has_one :image, as: :media, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :products_cart,through: :carts, source: :product

  validates :email, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length},
    format: {with: Settings.validations.email_regex}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length}
  validates :name, presence: true, length: {minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length}
  validates :phone, presence: true, format: {with: Settings.validations.phone_regex},
    allow_nil: true
  validates :address, presence: true, length: {minimum: 10, maximum: 1000},
    allow_nil: true
end
