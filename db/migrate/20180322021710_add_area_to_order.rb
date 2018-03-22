class AddAreaToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :area, foreign_key: true
  end
end
