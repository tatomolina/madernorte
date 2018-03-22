class RemoveWidthMeasureFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :width_measure, foreign_key: true
  end
end
