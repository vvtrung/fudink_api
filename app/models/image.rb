class Image < ApplicationRecord
  belongs_to :media, polymorphic: true, optional: true

  mount_uploader :link, PictureUploader

  validate  :picture_size

  private

  def picture_size
    return if link.size <= 5.megabytes
    errors.add :image, "should be less than 5MB"
  end
end
