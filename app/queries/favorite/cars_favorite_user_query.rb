module CarsFavoriteUserQuery
  extend self
  attr_reader :query

  def query(user_id)
    @query = Car.joins(:favorites, :car_favorite)
                .joins(car_favorites: :users)
                .where(User.id = user_id)
                .select(
                  "id",
                  "name",
                  "brand",
                  "year",
                  "plate",
                  "user.name AS user_name"
                )
    @query = @query.map do |entry|
      {
        id: entry.id,
        name: entry.name,
        brand: entry.brand,
        year: entry.year,
        plate: entry.plate,
        user_name: entry.user_name
      }
    end

  end
end