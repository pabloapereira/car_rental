module CarsFavoriteUserQuery
  extend self
  attr_reader :query

  def query(user_id)
    user_name = User.find_by(id: user_id)&.name

    @query = User.joins(favorite: [car_favorites: :car])
                 .select("users.id AS user, users.name AS user_name, cars.id AS car_id, cars.name AS car_name,
                          cars.brand AS car_brand, cars.year AS car_year, cars.plate AS car_plate")
                 .where(id: user_id)
                 .distinct

    data = @query.map do |entry|
      [
        entry.user,
        entry.user_name,
        entry.car_id,
        entry.car_name,
        entry.car_brand,
        entry.car_year,
        entry.car_plate
      ]
    end

    return data, user_name
  end
end
