FactoryBot.define do
  factory :bid do
    auction { Auction.first || association(:auction) }
    user { User.first || association(:user) }
    value { Faker::Number.decimal(2) }
  end
end
