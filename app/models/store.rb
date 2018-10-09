class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy

  enum status: %i(pedding accepted rejected block)
end
