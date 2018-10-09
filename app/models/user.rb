class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_secure_password

  belongs_to :role
  has_many :stores, dependent: :destroy
  has_one :shipper, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email, presence: true,
    length: {in: Settings.validations.strings.min_length..Settings.validations.strings.max_length},
    format: {with: Settings.validations.email_regex},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {in: Settings.validations.strings.min_length..Settings.validations.strings.max_length}
  validates :name, presence: true,
    length: {in: Settings.validations.strings.min_length..Settings.validations.strings.max_length}
  validates :phone, presence: true, format: {with: Settings.validations.phone_regex}
  validates :address, presence: true
end
