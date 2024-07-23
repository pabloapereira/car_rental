class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # Retorna uma coleção com todos os objetos do tipo User
  def index
    @users = User.all

    render json: @users
    # O @ indica uma variavel de instancia que pode ser acessa em todos os lugar do codigo
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
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

    def user_params
      params.require(:users).permit(:name, :age, :cpf, :driver_license, :card)
    end
end
