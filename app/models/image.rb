class Image < ApplicationRecord
  belongs_to :media, polymorphic: true
end
