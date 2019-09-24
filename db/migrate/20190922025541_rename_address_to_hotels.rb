class RenameAddressToHotels < ActiveRecord::Migration[5.2]
  def change
  	rename_column :hotels, :location, :address
  end
end
