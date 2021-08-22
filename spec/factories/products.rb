FactoryBot.define do
  factory :product do
    name                 { "testtest" }
    introduction         { "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" }
    category1_id         { 2 }
    category2_id         { 2 }
    category3_id         { 2 }
    charge_id            { 2 }
    prefecture_id        { 2 }
    scheduled_day_id     { 2 }
    price                { 5000 }
    association :corporate_user
    
    after(:build) do |product|
      product.image.attach(io: File.open("public/images/耳をすませば.jpeg"), filename: "耳をすませば.jpeg")
    end
  end
end
