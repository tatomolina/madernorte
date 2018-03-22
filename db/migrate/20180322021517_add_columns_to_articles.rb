class AddColumnsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :width_measure, foreign_key: true
    add_reference :articles, :height_measure, foreign_key: true
  end
end
