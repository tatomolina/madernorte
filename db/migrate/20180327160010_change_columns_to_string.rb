class ChangeColumnsToString < ActiveRecord::Migration[5.1]
  def self.up
    change_column :articles, :quantity, :string
    change_column :articles, :width, :string
    change_column :articles, :height, :string
    change_column :articles, :long, :string
  end

  def self.down
    change_column :articles, :quantity, :integer
    change_column :articles, :width, :integer
    change_column :articles, :height, :integer
    change_column :articles, :long, :integer
  end
end
