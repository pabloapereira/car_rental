module  CarQuery
  extend self
  attr_reader :query

  def get_query
    @query = Car.select(
      "name",
      "brand",
      "year",
      "plate",
      "store_id"
    )

    @query = @query.map do |entry|
      {
        name: entry.name,
        brand: entry.brand,
        year: entry.year,
        plate: entry.plate,
        store_id: entry.store_id
      }.values

    end
  end
end