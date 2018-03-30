class AddDetailsToCommonArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :common_articles, :details, :text
  end
end
