require_relative '../queries/favorite/cars_favorite_user_query'

class FavoritesCarsUserReportController < ReportsController
  include CarsFavoriteUserQuery

  def index
    user_id = params[:option] || 1
    data = CarsFavoriteUserQuery::query(user_id)
    headers = ["id", "name", "brand", "year", "plate", "user_name"]
    title = "teste"
    generate_report("tes", data, headers, title)
  end
end