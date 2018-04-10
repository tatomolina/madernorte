class AddPayedToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :payed, :bool
  end
end
