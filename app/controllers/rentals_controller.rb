class RentalsController < ApplicationController
  def create
    @rental = CarUser.new(params_rental)

    if @rental.save
      render json: @rental, status: :ok
    else
      render json: @rental, status: :unprocessable_entity
    end
  end

  private
  def params_rental
    params.require(:rental).permit(:car_id, :user_id)
  end
end