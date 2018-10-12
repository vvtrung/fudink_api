class Store < ApplicationRecord
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy

  enum status: %i(pedding accepted rejected block)

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :email, presence: true,
    length: {in: Settings.validations.strings.min_length..Settings.validations.strings.max_length},
    format: {with: Settings.validations.email_regex},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    length: {in: Settings.validations.strings.min_length..Settings.validations.strings.max_length},
    uniqueness: {case_sensitive: false}
  validates :phone, presence: true,
    format: {with: Settings.validations.phone_regex}
  validates :address, presence: true
  validates :open_at, presence: true
  validates :close_at, presence: true
end
