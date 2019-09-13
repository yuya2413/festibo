class CreateHotelPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_photos do |t|
      t.references :hotel, foreign_key: true
      t.string :image_id

      t.timestamps
    end
  end
end
