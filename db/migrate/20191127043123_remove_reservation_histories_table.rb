class RemoveReservationHistoriesTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :reservation_histories
  end
end
