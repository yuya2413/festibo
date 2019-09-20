class Plan < ApplicationRecord
  belongs_to :room_type

  has_many :reservations, dependent: :destroy


  validates :charge, presence:{ message: "一泊料金を入力してください" }
  validates :start_date, presence:{ message: "適用開始日を入力してください" }

end
