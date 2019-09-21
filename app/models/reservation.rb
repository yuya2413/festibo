class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :festival, optional: true
  belongs_to :room

  validates :start_date, presence:{ message: "チェックイン日を入力してください" }
  validates :end_date, presence:{ message: "チェックアウト日を入力してください" }
  validates :total_charge, presence: true
end
