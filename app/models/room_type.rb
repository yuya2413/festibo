class RoomType < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :rooms, dependent: :destroy
  belongs_to :hotel

  validates :name, presence:{ message: "部屋タイプ名を入力してください" }
  validates :people_count, presence:{ message: "設定人数を入力してください" }

end
