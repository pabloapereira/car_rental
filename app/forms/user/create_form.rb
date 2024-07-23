class User::CreateForm
  include ActiveModel::Model

  attr_accessor :name, :age, :cpf, :driver_license, :card

  validates :name, :age, :cpf, :driver_license, :card, presence: true

  def create
    return false if invalid?

    create_user
  end

  private
  def create_user
    user = User.new(name: name, age: age, cpf: cpf, driver_license: driver_license, card: card)
    user.save

    if user.persisted?
      favorite = user.build_favorite
      favorite.save

    else
      errors.merge!(user.errors)
      return false
    end

    return true
  end
end