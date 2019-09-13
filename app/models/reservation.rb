class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :festival
  belongs_to :room
  belongs_to :plan
end
