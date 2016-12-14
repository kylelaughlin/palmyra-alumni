class AddToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :time, :string
    add_column :events, :rsvp_by, :date
    add_column :events, :payment_instructions, :text
  end
end
