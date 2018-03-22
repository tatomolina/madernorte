class AddWidthCmToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :width_cm, :bool
  end
end
