FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { "abcd12" }
    password_confirmation { password }
    postcode              { "123-4567" }
    prefecture_id         { 2 }
    city                  { "新宿区" }
    house_number          { "新宿１−１" }
    building_name         { "新宿103" }
    phone_num             { "09012345678" }
    birthday              { "1998-02-18" }
  end
end
