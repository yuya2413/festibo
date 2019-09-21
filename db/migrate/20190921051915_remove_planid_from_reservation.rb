class RemovePlanidFromReservation < ActiveRecord::Migration[5.2]
  #変更後
  def up
    remove_column :reservations, :plan_id, :null => false
  end

  #変更前
  def down
    add_column :reservations, :plan_id, :null => false
  end
end
