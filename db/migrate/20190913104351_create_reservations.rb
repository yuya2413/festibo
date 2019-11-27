class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :festival, foreign_key: true
      #t.references :room, foreign_key: true
      #t.references :plan, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :total_charge

      t.timestamps
    end
  end
end
