class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show update destroy]

  # Lista todos os favoritos
  def index
    @favorites = Favorite.all
    render json: @favorites
  end

  # Exibe apenas o favorite qual contem o id
  def show
    render json: @favorite
  end

  # Faz a criação de um novo Favorite
  def create
    @favorite = Favorite.new(params_favorite)

    if @favorite.save
      render json: @favorite, status: :ok
    else
      render json: @favorite, status: :unprocessable_entity
    end
  end

  # Faz atualização do Favorite qual contem o id
  def update
    if @favorite.update(params_favorite)
      render json: @favorite, status: :ok
    else
      render json: @favorite, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
    head :no_content
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def params_favorite
      params.require(:favorites).permit(:user_id)
    end
end