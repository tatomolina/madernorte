class CreateCommonArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :common_articles do |t|
      t.string :quantity
      t.string :description
      t.boolean :done
      t.boolean :delivered
      t.boolean :invoiced
      t.boolean :process

      t.timestamps
    end
  end
end
