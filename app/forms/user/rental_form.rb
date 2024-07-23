class User::CreateModel
  require ActiveRecord::Model

  attr_accessor :user, :car

  validates :user, :car, presence: true

  def constructor(params)
    super
    @user = User.find(params[:user_id]) if params[:user_id]
    @car = Car.find(params[:car_id]) if params[:car_id]
  end

  def to_hire
    return false unless valid?

    CarLocation.transaction do
      car_available

    end
  end

  private
  def car_available
    if CarUser.find_by(id: @car)
      return true
    else
      return false
    end
  end
end
