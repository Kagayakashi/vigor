class Event < ApplicationRecord
  extend Mobility

  translates :title, backend: :action_text, plain: true, fallbacks: { lv: :ru, en: :ru }
  translates :content, backend: :action_text, fallbacks: { lv: :ru, en: :ru }
end
