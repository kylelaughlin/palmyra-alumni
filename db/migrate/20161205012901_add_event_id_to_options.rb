class AddEventIdToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :event_options, :event_id, :integer
  end
end
