json.extract! image, :id, :name, :image_category_id, :created_at, :updated_at
json.url image_url(image, format: :json)
