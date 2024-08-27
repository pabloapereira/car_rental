class User::RentalForm
  include ActiveModel::Model

  attr_accessor :user_id, :car_id, :user, :car

  validates :user_id, :car_id, presence: true
  validate :check_car_availability

  def initialize(params = {})
    @user_id = params[:user_id]
    @car_id = params[:car_id]
    @user = User.find_by(id: @user_id)
    @car = Car.find_by(id: @car_id)
  end

  def rent
    return false unless valid?

    CarUser.transaction do
      create_car_user_association
    end
  rescue ActiveRecord::RecordInvalid => e
    { error: e.message }
  end

  private

  def check_car_availability
    if @car && CarUser.exists?(car_id: @car.id)
      errors.add(:car_id, 'Carro não está disponível para locação')
    end
  end

  def create_car_user_association
    CarUser.create!(car_id: @car.id, user_id: @user.id)
    {
      user_id: @user.id,
      car_id: @car.id,
      message: 'Associação criada com sucesso.'
    }
  end
end
