class AddClassmateDetailstoClassmates < ActiveRecord::Migration[5.0]
  def change
    add_column :classmates, :address_line_one, :string
    add_column :classmates, :address_line_two, :string
    add_column :classmates, :city, :string
    add_column :classmates, :state, :string
    add_column :classmates, :zip, :string
    add_column :classmates, :phone, :string
    add_column :classmates, :is_private, :boolean
  end
end
