class AddPaypalAttributesToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :payment_on, :datetime
    add_column :rsvps, :paypal_payment_status, :string
    add_column :rsvps, :paid_amount, :integer
  end
end
