class Store < ApplicationRecord
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum status: %i(pending accepted rejected block)

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :email, presence: true, length: {
    minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length},
    format: {with: Settings.validations.email_regex},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {
    minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length},
    uniqueness: {case_sensitive: false}
  validates :phone, presence: true, format: {with: Settings.validations.phone_regex}
  validates :address, presence: true, length: {
    minimum: Settings.validations.text.min_length,
    maximum: Settings.validations.text.max_length}
  validates :open_at, presence: true
  validates :close_at, presence: true
end
