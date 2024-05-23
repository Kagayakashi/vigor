class Image < ApplicationRecord
  belongs_to :image_category
  has_one_attached :image

  validates :image, presence: true
  # validate :image_presence_and_size

  private

  def image_presence_and_size
    if image.attached?
      if image.blob.byte_size.zero?
        errors.add(:image, :invalid_image)
        image.purge
      end
    else
      errors.add(:image, :blank)
    end
  end
end
