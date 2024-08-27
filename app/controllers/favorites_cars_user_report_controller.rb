require '../queries/favorite/cars_favorite_user'

class FavoritesCarsUserReportController
  include CarsFavoriteUserQuery

  def index
    user_id = params[:option] || 1
    data = CarsFavoriteUserQuery::query
    headers = ["id", "name", "brand", "year", "plate", "user_name"]
    title = "teste"
    generate_report("tes", data, headers, title)
  end
end