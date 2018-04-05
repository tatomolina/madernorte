class RemoveColumnsFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :width
    remove_column :articles, :height
    remove_column :articles, :width_cm
    remove_column :articles, :height_cm
    remove_column :articles, :long
  end
end
