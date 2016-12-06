class FixNameEventOptionInAttendees < ActiveRecord::Migration[5.0]
  def change
    rename_column :attendees, :event_option, :event_option_id
  end
end
