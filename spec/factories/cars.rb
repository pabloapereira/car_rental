FactoryBot.define do
  factory :car do
    name { Faker::Vehicle.make_and_model}
      brand { Faker::Vehicle.make }
      year {Faker::Number.binary(digits: 4) }
      plate { Faker::Vehicle.license_plate}
      store_id { Store.pluck(:id).sample}
  end
end