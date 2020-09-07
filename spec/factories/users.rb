FactoryBot.define do

  factory :user do

    password = Faker::Internet.password(7)
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    phonetic_last_name    { Faker::Name.last_name }
    phonetic_first_name   { Faker::Name.first_name }
    birthday              { Faker::Date.between(from: 2.days.ago, to: Date.today) }

  end

end