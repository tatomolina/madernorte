class CreateWidthMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :width_measures do |t|
      t.string :name

      t.timestamps
    end
  end
end
