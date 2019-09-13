class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :room_type
end
