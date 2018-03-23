class AddColumnsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :phone, :string
    add_column :orders, :phone_reference, :string
    add_column :orders, :observations, :text
  end
end
