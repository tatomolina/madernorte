class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.float :quantity
      t.float :width
      t.float :height
      t.float :long
      t.string :description
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
