class FestivalsCategory < ApplicationRecord
  belongs_to :festival
  belongs_to :category
end
