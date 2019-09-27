class Hotel < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :hotel_photos, dependent: :destroy
  accepts_attachments_for :hotel_photos, attachment: :image
  accepts_nested_attributes_for :hotel_photos, allow_destroy: true

  has_many :room_types, dependent: :destroy
  accepts_nested_attributes_for :room_types, allow_destroy: true

  has_many :reservation_histories

  validates :name, presence:{ message: "ホテル名を入力してください" }
  validates :address, presence:{ message: "ホテル住所を入力してください" }

  def self.search(search)
  	return Hotel.all unless search
    Hotel.where([' name LIKE ? ', "%#{search}%"])
  end
  def self.search_by_address(search_by_address)
    return Hotel.all unless search_by_address
    Hotel.where([' address LIKE ? ', "%#{search_by_address}%"])
  end
end
