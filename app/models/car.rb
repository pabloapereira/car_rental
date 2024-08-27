class Car < ApplicationRecord
  belongs_to :store
  has_many :car_favorites
  has_many :favorites, through: :car_favorites
end
