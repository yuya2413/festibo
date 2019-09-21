class RemoveStartDateFromPlan < ActiveRecord::Migration[5.2]

  #変更後
  def up
    remove_column :plans, :start_date, :date, :null => false
  end

  #変更前
  def down
    add_column :plans, :start_date, :date, :null => false
  end
end
