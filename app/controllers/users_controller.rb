class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :set_rental, only: %i[delete_bond]

  # Retorna uma coleção com todos os objetos do tipo User
  def index
    @users = User.all

    render json: @users
  end

  # Retorna apenas um objeto da coleção User que é predicado pelo seu :id
  def show
    render json: @user
  end

  # Cria um novo formulario para um novo registro do recurso mas não salva no banco
  def new
  end

  # Procesa a criação de um novo registro
  def create
    @form = User::CreateForm.new(user_params)

    #binding.pry
    if @form.create
      render json: @form, status: :created
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # Cria um form para editar um registro existente por base do id
  def edit
  end

  # Salva as edições realizadas no edit
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user, status: :unprocessable_entity
    end
  end

  # Faz a exclusão de um registro existente no banco de dados
  def destroy
    if @user.favorite.present?
      @user.favorite.destroy
    end

    @user.destroy
    head :no_content
  end

  def bond
    @rental = User::RentalForm.new(rental_params)

    result = @rental.rent

    if result
      render json: result, status: :created
    else
      render json: { error: 'Não foi possível realizar a locação.' }, status: :unprocessable_entity
    end
  end

  def delete_bond
    @rental.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_rental
    @rental = CarUser.find(params[:rental_id])
  end

  def user_params
    params.require(:users).permit(:name, :age, :cpf, :driver_license, :card)
  end

  def rental_params
    params.require(:users).permit(:car_id, :user_id)
  end
end
