class ImageCategory < ApplicationRecord
  extend Mobility

  has_many :images

  translates :name, backend: :action_text, plain: true, fallbacks: { lv: :ru, en: :ru }

  validates :name_ru, presence: true
end
