class AddColumnHotel < ActiveRecord::Migration[5.2]
  def up
    add_column :hotels, :latitude, :float
    add_column :hotels, :longitude, :float
  end

  def down
    remove_column :hotels, :latitude, :float
    remove_column :hotels, :longitude, :float
  end
end
