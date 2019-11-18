class AddPrefectureToHotel < ActiveRecord::Migration[5.2]
  def change
    add_reference :hotels, :prefecture, foreign_key: true
  end
end
