json.extract! reservation, :id, :user_id, :common_area_id, :date, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
