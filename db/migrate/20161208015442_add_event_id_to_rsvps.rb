class AddEventIdToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :event_id, :integer
  end
end
