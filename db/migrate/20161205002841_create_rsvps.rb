class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :classmate_id
      t.integer :total_cost
      t.string :payment_status, default: "Not Paid"

      t.timestamps
    end
  end
end
