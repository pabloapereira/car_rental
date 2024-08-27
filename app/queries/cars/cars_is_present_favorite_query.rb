module CarIsPresentFavoriteQuery
  extend self
  attr_reader :query

  def get_query(car_id)
    # Erro de relação entre Car e Favorite
    @query = Car.joins(:car_favorite, :favorite)
                .joins("INNER JOIN  users ON users.id = favorites.user_id")
                .where(id: car_id)
                .select(
      "cars.id AS car_id",
      "cars.name AS car_name",
      "cars.brand AS car_brand",
      "cars.year AS car_year",
      "cars.plate AS car_plate",
      "users.id AS user_id",
      "users.name AS user_name",

                #binding.pry
    )
  end
end