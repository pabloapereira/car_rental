class CarsController < ApplicationController
  before_action :set_car, only: %i[ show update destroy]

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created
    else
        render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      render json: @car, status: :ok
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    head :no_content
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:cars).permit(:name, :brand, :year, :plate, :store_id)
    end
end
