json.extract! ticket, :id, :booking_id, :name, :email, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
