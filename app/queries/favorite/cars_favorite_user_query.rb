module CarsFavoriteUserQuery
  extend self
  attr_reader :query

  def query(user_id)
    @query = CarFavorite.joins(:car, :favorite)
                .joins(favorite: :user)
                .select(
                  "id",
                  "name",
                  "brand",
                  "year",
                  "plate",
                  "user.name AS user_name"
                )
                .where("user.id": user_id)

    binding.pry

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