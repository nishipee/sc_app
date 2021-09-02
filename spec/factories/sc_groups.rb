FactoryBot.define do
  factory :sc_group do
    name          { "testtest" }
    introduction  { "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" }
    how_donation  { "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" }
    association :admin
    
    after(:build) do |sc_group|
      sc_group.image.attach(io: File.open("public/images/耳をすませば.jpeg"), filename: "耳をすませば.jpeg")
    end
  end
end
