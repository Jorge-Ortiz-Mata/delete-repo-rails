json.extract! post, :id, :name, :description, :year, :created_at, :updated_at
json.url post_url(post, format: :json)
