class AddOnDeliveryToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :on_delivery, :bool
  end
end
