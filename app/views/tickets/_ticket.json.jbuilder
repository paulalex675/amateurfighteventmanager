json.extract! ticket, :id, :current_user_id, :event_id, :price, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
