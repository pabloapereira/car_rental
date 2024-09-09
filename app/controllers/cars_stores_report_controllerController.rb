require_relative '../queries/cars/car_store_query'
class CarsStoresReportController < ReportsController
  include CarStoreQuery

  def index
    store_id = params[:option] || 1
    data, store_name = CarStoreQuery::get_query(store_id)

    headers = ["id_car", "name", "brand", "year", "plate"]
    title = "#{store_name}"
    generate_report("teste", "titulo Teste")#, data, headers, title
  end
end