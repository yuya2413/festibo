class CreateFestivalsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals_categories do |t|
      t.references :festival, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
