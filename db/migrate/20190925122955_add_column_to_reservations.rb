class AddColumnToReservations < ActiveRecord::Migration[5.2]
  def up
    add_reference :reservations, :hotel, foreign_key: true
  end

  def down
    remove_reference :reservations, :hotel, foreign_key: true
  end
end
