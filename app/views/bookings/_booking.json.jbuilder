json.extract! booking, :id, :event_id, :user_id, :number_of_guests, :created_at, :updated_at
json.url booking_url(booking, format: :json)
