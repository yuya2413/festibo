class Hotel < ApplicationRecord
	has_many :hotel_photos dependent: :destroy
	has_many :room_types dependent: :destroy
    has_many :reservation_histories

	validates :name, presence:{ message: "ホテル名を入力してください" }
    validates :name, presence:{ message: "ホテル住所を入力してください" }
end
