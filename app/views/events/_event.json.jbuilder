json.extract! event, :id, :name, :date, :content, :created_at, :updated_at
json.url event_url(event, format: :json)