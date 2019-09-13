class ReservationHistory < ApplicationRecord
  belongs_to :user
  belongs_to :festival
  belongs_to :hotel
end
