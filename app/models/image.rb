class Image < ApplicationRecord
  belongs_to :image_category
  has_one_attached :image
end
