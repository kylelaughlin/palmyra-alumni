class AddClassToClassmates < ActiveRecord::Migration[5.0]
  def change
    add_column :classmates, :class_year, :string
  end
end
