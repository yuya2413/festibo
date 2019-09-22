class AddColumnToFestival < ActiveRecord::Migration[5.2]
  def up
    add_column :festivals, :latitude, :float
    add_column :festivals, :longitude, :float
  end

  def down
    remove_column :festivals, :latitude, :float
    remove_column :festivals, :longitude, :float
  end
end
