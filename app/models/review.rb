class Review < ApplicationRecord
  belongs_to :user
  belongs_to :festival, optional: true

  validates :title, presence:{ message: "タイトルを入力してください" }
  validates :body, presence:{ message: "本文を入力してください" }
end
