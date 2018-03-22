class RemoveHeightMeasureFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :height_measure, foreign_key: true
  end
end
