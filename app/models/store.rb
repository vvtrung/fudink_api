class Store < ApplicationRecord
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy

  geocoded_by :address
  before_validation :generate_lat_long_from_address

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
  validate :validate_format_address

  private

  def validate_format_address
    return if latitude.present? && longitude.present?
    errors.add :address, :invalid
  end

  def generate_lat_long_from_address
    location = Geocoder.coordinates address
    return if location.blank?
    self.latitude, self.longitude = location[0], location[1]
  end
end
