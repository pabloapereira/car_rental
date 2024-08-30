require_relative '../queries/favorite/cars_favorite_user_query'

class FavoritesCarsUserReportController < ReportsController
  include CarsFavoriteUserQuery

  def index
    user_id = params[:option] || 1
    data, user_name = CarsFavoriteUserQuery::query(user_id)

    headers = ["id usuario", "Usuario", "id Carro", "Carro", "Marca", "Ano", "Placa"]
    title = "Carros favoritos de #{user_name}"
    generate_report("tes", data, headers, title)
  end
end

