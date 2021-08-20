FactoryBot.define do
  factory :corporate_user do
    name                  { "test" }
    postcode              { "123-4567" }
    prefecture_id         { 2 }
    city                  { "新宿区" }
    house_number          { "新宿１−１" }
    building_name         { "新宿ビル" }
    phone_num             { "09012345678" }
    email                 { Faker::Internet.free_email }
    password              { "abcd12" }
    password_confirmation { password }
  end
end
