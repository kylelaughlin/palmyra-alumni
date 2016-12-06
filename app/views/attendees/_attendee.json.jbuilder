json.extract! attendee, :id, :rsvp_id, :name, :event_option, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)