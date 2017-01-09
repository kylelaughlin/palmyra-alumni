class AddContactEmailToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :contact_email, :string
  end
end
