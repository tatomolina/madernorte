class AddOrderToCommonArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :common_articles, :order, foreign_key: true
  end
end
