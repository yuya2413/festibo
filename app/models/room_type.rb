class RoomType < ApplicationRecord
  belongs_to :hotel

  has_many :plans, dependent: :destroy
  accepts_nested_attributes_for :plans, allow_destroy: true

  has_many :rooms, dependent: :destroy
  accepts_nested_attributes_for :rooms, allow_destroy: true

  validates :name, presence:{ message: "部屋タイプ名を入力してください" }
  validates :people_count, presence:{ message: "設定人数を入力してください" }

end
