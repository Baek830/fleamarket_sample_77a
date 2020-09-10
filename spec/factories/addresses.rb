FactoryBot.define do

  factory :DeliveryAddress do

    last_name             { "山田" }
    first_name            { "彩" }
    phonetic_last_name    { "ヤマダ" }
    phonetic_first_name   { "アヤ" }
    postal_code           { Faker::Address.zip_code }
    prefecture_id         { Faker::Number.digit }
    city                  { Faker::Address.city }
    ward                  { Faker::Address.street_address }
    building              { Faker::Address.building_number }
    phone_number          { Faker::PhoneNumber.cell_phone }

  end

end