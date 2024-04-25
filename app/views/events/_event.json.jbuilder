json.extract! event, :id, :title, :date, :from, :to, :created_at, :updated_at
json.url event_url(event, format: :json)
