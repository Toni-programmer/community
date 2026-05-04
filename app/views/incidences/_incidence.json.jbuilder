json.extract! incidence, :id, :community_id, :user_id, :description, :date, :status, :photo, :created_at, :updated_at
json.url incidence_url(incidence, format: :json)
