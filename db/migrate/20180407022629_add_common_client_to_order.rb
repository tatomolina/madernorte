class AddCommonClientToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :common_client, :string
  end
end
