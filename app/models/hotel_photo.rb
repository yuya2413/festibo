class HotelPhoto < ApplicationRecord
  belongs_to :hotel
  attachment :image
end
