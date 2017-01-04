class AddInvoiceIdToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :invoice_id, :string
  end
end
