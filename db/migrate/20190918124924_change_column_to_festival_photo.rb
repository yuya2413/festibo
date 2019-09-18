class ChangeColumnToFestivalPhoto < ActiveRecord::Migration[5.2]

#変更内容
  def up
  	change_column :festival_photos, :image_id, :text, null: false
  end
#変更前
  def down
  	change_column :festival_photos, :image_id, :string, null: false
  end
end
