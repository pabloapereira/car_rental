module CarStoreQuery
  extend self
  attr_reader :query

  def get_query(id)
    store_name = Store.find_by(id: id)&.name || "Loja Desconhecida"

    @query = Car.joins(:store).where(store_id: id)
                .select(
                  "id",
                  "name",
                  "brand",
                  "year",
                  "plate",
                )

    data = @query.map do |entry|
      {
        car_id: entry.id,
        car_name: entry.name,
        brand: entry.brand,
        year: entry.year,
        plate: entry.plate
      }.values
    end

    return data, store_name
  end
end
