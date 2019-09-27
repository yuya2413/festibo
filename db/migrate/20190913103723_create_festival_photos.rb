class CreateFestivalPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :festival_photos do |t|
      t.references :festival, foreign_key: true
      t.string :image_id

      t.timestamps
    end
  end
end
