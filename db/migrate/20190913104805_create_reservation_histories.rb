class CreateReservationHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_histories do |t|
      t.references :user, foreign_key: true
      t.references :festival, foreign_key: true
      t.references :hotel, foreign_key: true
      t.string :festival_name
      t.string :festival_location
      t.string :hotel_name
      t.string :hotel_location
      t.string :room_information
      t.date :start_date
      t.date :end_date
      t.integer :total_charge

      t.timestamps
    end
  end
end
