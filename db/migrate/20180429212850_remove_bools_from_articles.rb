class RemoveBoolsFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :delivered
    remove_column :articles, :done
    remove_column :articles, :process
    remove_column :articles, :on_delivery
  end
end
