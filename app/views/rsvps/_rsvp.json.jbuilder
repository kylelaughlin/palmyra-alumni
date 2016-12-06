json.extract! rsvp, :id, :classmate_id, :total_cost, :payment_status, :created_at, :updated_at
json.url rsvp_url(rsvp, format: :json)