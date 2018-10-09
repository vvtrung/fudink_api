class Product < ApplicationRecord
  belongs_to :category
  belongs_to :store
  has_many :sizes, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :detail_orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy
end
