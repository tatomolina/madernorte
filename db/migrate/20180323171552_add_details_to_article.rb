class AddDetailsToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :details, :text
  end
end
