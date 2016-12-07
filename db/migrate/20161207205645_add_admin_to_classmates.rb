class AddAdminToClassmates < ActiveRecord::Migration[5.0]
  def change
    add_column :classmates, :admin, :boolean, default: false
  end
end
