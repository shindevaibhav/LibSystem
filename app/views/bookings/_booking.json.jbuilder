json.extract! booking, :id, :date, :slot_start, :created_at, :updated_at
json.url booking_url(booking, format: :json)