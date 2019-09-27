class Room < ApplicationRecord
  belongs_to :room_type

  has_many :reservations, dependent: :destroy

end
