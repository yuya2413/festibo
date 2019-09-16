class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :festival, optional: true
end
