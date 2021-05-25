json.extract! event, :id, :gym_id, :event_date, :event_name, :event_info, :created_at, :updated_at
json.url event_url(event, format: :json)
