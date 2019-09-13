class ReservationHistory < ApplicationRecord
  belongs_to :user
  belongs_to :festival
  belongs_to :hotel

  validates :festival_name, presence: true
  validates :festival_location, presence: true
  validates :hotel_name, presence: true
  validates :hotel_location, presence: true
  validates :room_information, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_charge, presence: true
end
