class AddHeightCmToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :height_cm, :bool
  end
end
