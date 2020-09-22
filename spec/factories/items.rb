FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.words }
    description           { Faker::Lorem.sentence }
    genre_id              { '2' }
    condition_id          { '2' }
    shipping_fee_info_id  { '2' }
    location_id           { '2' }
    days_to_ship_id       { '2' }
    price                 { '500' }
    association :user
  end
end
