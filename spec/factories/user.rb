FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
      age { Faker::Number.binary(digits: 2) }
      cpf { Faker::Number.binary(digits: 4) }
      driver_license { 'B' }
      card { 111 }
  end
end