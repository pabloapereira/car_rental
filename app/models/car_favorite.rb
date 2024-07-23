class CarFavorite < ApplicationRecord
  belongs_to :car
  belongs_to :favorite
end
