class ChangeColumnsPrefecture < ActiveRecord::Migration[5.2]

#変更内容
  def up
  	change_column :prefectures, :name, :integer, null: false
  end
#変更前
  def down
  	change_column :prefectures, :name, :string, null: false
  end
end
