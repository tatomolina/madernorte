class AddProcessToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :process, :bool
  end
end
