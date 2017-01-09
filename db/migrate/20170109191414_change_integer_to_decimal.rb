class ChangeIntegerToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :event_options, :price, :decimal, precision: 6, scale: 2
    change_column :rsvps, :total_cost, :decimal, precision: 6, scale: 2
    change_column :rsvps, :paid_amount, :decimal, precision: 6,scale: 2
  end
end
