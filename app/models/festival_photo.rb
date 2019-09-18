class FestivalPhoto < ApplicationRecord
  belongs_to :festival, optional: true
  attachment :image
end
