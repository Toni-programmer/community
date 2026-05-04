json.extract! meeting, :id, :community_id, :date, :type_meeting, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
