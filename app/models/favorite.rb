class Favorite < ApplicationRecord
  belongs_to :user
  has_one :car_favorite, dependent: :destroy
end
