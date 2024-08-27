# Criação da loja
puts "Creating store"
stores = []
2.times do
  stores << Store.create!(
    name: Faker::Name.first_name,
    #cnpj: Faker::IdNumber.brazilian_id(formatted: true),
    cnpj: Faker::Number.binary(digits: 4),
    #telephone_number: Faker::PhoneNumber.phone_number,
    telephone_number: Faker::Number.binary(digits: 4),
    adress: Faker::Address.street_address ,
  )
end

# Criação carro
puts "Creating car"
cars = []
2.times do
  cars << Car.create!(
    name: Faker::Vehicle.make_and_model,
    brand: Faker::Vehicle.make,
    year: Faker::Number.binary(digits: 4),
    plate: Faker::Vehicle.license_plate ,
    store_id: Store.pluck(:id).sample,
    )
end

# Criação de Usuários
puts "Creating users..."
users = []
2.times do
  users << User.create!(
    name: Faker::FunnyName.name,
    age: Faker::Number.binary(digits: 2),
    cpf: Faker::Number.binary(digits: 4),
    #cpf: Faker::IdNumber.brazilian_id(formatted: true),
    driver_license: 'B',
    card: 111,
    )
end

# Criação de car user
=begin
puts "Creating car user"
car_users = []
2.times do
  car_users << CarUser.create!(
    car_id: Car.pluck(:id).sample,
    user_id: User.pluck(:id).sample,
  )
end
=end
# Criação de favorite
puts "Creating favorites"
favorites = []
2.times do
  favorites << Favorite.create!(
    user_id: User.pluck(:id).sample,
  )
end

# Criação de car_favorite
puts "Creating car_favorite"
car_favorites = []
2.times do
  car_favorites << CarFavorite.create!(
    car_id: Car.pluck(:id).sample,
    favorite_id: Favorite.pluck(:id).sample,
  )
end