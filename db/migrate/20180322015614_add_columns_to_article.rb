class AddColumnsToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :done, :bool
    add_column :articles, :delivered, :bool
    add_column :articles, :invoiced, :bool
  end
end
