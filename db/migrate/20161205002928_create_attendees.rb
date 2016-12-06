class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :rsvp_id
      t.string :name
      t.integer :event_option

      t.timestamps
    end
  end
end
