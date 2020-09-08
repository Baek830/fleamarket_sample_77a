FactoryBot.define do

  factory :user do

    password = Faker::Internet.password(7)
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    last_name             { "山田" }
    first_name            { "彩" }
    phonetic_last_name    { "ヤマダ" }
    phonetic_first_name   { "アヤ" }
    birthday              { Faker::Date.between(from: 2.days.ago, to: Date.today) }

  end

end