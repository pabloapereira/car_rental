class StoresController < ApplicationController
  before_action :set_store, only: %i[ show update destroy]
  def index
    @stores = Store.all

    render json: @stores
  end

  def show
    render json: @store
  end

  def create
    @store = Store.new(params_store)

    if @store.save
      render json: @store, status: :created
    else
      render json: @store, status: :unprocessable_entity
    end
  end

  def update
    if @store.update(params_store)
      render json: @store, status: :ok
    else
      render json: @store, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy
    head :no_content
  end

  private
  def set_store
    @store = Store.find(params[:id])
  end

  def params_store
    params.require(:stores).permit(:name, :cnpj, :telephone_number, :adress)
  end
end