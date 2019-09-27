class AddColumnToRoomType < ActiveRecord::Migration[5.2]
  def up
    add_column :room_types, :charge, :integer
    change_column :room_types, :charge, :integer, null: false
  end

  def down
  	remove_column :room_types, :charge, :integer
  end
end
