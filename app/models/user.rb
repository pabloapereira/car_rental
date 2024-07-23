class User < ApplicationRecord
  has_one :favorite, dependent: :destroy
end
