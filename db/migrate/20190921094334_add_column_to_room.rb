class AddColumnToRoom < ActiveRecord::Migration[5.2]
  def up
    add_column :rooms, :name, :string
    change_column :room_types, :charge, :integer, null: false
  end

  def down
    remove_column :rooms, :name, :string
  end
end
