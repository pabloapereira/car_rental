FactoryBot.define do
  factory :store do
    name { Faker::Name.first_name}
    cnpj { Faker::Number.binary(digits: 4) }
    telephone_number { Faker::Number.binary(digits: 4) }
    adress { Faker::Address.street_address }
  end
end