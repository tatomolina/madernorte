class AddStateToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :article_state, foreign_key: true
  end
end
