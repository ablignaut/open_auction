FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name_with_middle }
    password { Faker::Internet.password }
  end
end
