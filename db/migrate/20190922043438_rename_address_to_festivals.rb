class RenameAddressToFestivals < ActiveRecord::Migration[5.2]
  def change
  	rename_column :festivals, :location, :address
  end
end
