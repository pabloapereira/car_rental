class Store < ApplicationRecord
  has_many :cars, dependent: :destroy
end
