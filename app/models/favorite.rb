class Favorite < ApplicationRecord
  belongs_to :user
  has_many :car_favorites, dependent: :destroy
  has_many :car, through: :car_favorites
end
