require_relative '../queries/cars/cars_is_present_favorite_query'

class CarsIsPresentFavoriteController < ReportsController
  include CarIsPresentFavoriteQuery

  def index
    car_id = params[:option]
    data = CarIsPresentFavoriteQuery::get_query(car_id)

    headers = ["id carro", "nome carro", "marca", "ano", "placa", "id usuario", "Nome"]
    title = "Teste"
    generate_report("TesteNovo",data, headers, title)
  end
end