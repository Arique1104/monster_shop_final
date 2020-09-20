# require "faker"
# require "factory_bots_rails"
# require "support/factory_bots"

FactoryBot.define do
  factory :merchant do
    name { Faker::Name.unique.name }
    address { Faker::Address.street_address }
    city {Faker::Address.city }
    state {Faker::Address.state_abbr }
    zip {Faker::Address.zip }
  end
  factory :user do
    name { Faker::Name.unique.name }
    address { Faker::Address.street_address }
    city {Faker::Address.city }
    state {Faker::Address.state_abbr }
    zip {Faker::Address.zip }
    email { Faker::Internet.email(name: "#{name}") }
    password { Faker::Internet.password(min_length: 8) }
  end
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price {Faker::Commerce.price}
    image { Faker::LoremPixel.image(size: "730x411")}
    active {true}
    inventory  {Faker::Number.number(digits: 3)}
  end

end
