class CreateOptionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :option_types do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
