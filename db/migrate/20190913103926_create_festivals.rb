class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.references :prefecture, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.text :detail
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :value_1
      t.integer :value_2
      t.integer :value_3
      t.integer :value_4
      t.integer :value_5

      t.timestamps
    end
  end
end
