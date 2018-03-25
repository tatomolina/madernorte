class AddPriorityToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :priority, foreign_key: true
  end
end
