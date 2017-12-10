FactoryBot.define do
  factory :auction do
    start_value { Faker::Number.decimal(2) }
    current_value { start_value }
    ending_value { Faker::Number.decimal(5, 2) }
    description { Faker::Lorem.paragraph }
  end
end
