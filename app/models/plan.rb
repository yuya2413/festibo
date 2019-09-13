class Plan < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :room_type

  validates :charge, presence:{ message: "一泊料金を入力してください" }
  validates :start_date, presence:{ message: "適用開始日を入力してください" }

end
