class RemoveColumnFromFestival < ActiveRecord::Migration[5.2]
  def change
    remove_column :festivals, :category_id, :integer
  end
end
