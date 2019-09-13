class CreateRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :room_types do |t|
      t.references :hotel, foreign_key: true
      t.string :name
      t.integer :people_count

      t.timestamps
    end
  end
end
