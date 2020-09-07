FactoryBot.define do

  factory :DeliveryAddress do

    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    phonetic_last_name    { Faker::Name.last_name }
    phonetic_first_name   { Faker::Name.first_name }
    postal_code           { Faker::Address.zip_code }
    prefecture_id         { Faker::Number.digit }
    city                  { Faker::Address.city }
    ward                  { Faker::Address.street_address }
    building              { Faker::Address.building_number }
    phone_number          { Faker::PhoneNumber.cell_phone }

  end

end