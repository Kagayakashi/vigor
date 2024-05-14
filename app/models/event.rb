class Event < ApplicationRecord
  extend Mobility

  translates :title, backend: :action_text, plain: true, fallbacks: { lv: :ru, en: :ru }
  translates :content, backend: :action_text, fallbacks: { lv: :ru, en: :ru }

  validates :title_ru, presence: true
  validates :content_ru, presence: true

  #validates :title_lv, presence: true
  #validates :content_lv, presence: true

  #validates :title_en, presence: true
  #validates :content_en, presence: true
end
