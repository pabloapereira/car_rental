require_relative '../queries/cars/index_query'

class CarsReportController < ReportsController
  include CarQuery

  def index
    data = CarQuery::get_query
    headers = ["name", "brand", "Year", "plate", "store_id"]
    title = "Cars"
    generate_report("Carro", data, headers, title)
  end
  #binding.pry
end
