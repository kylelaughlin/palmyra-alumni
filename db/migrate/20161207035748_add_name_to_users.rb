class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :classmates, :first_name, :string
    add_column :classmates, :last_name, :string
  end
end
