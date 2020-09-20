namespace :db do
  desc "Erase and fill databse"
    task :populate => :environment do
  require 'faker'

#create merchant & items
    15.times do
      merchant_1 = Merchant.create!(name: Faker::Name.unique.name,
                      address: Faker::Address.street_address,
                      city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                      zip: Faker::Address.zip)
      item_1 = merchant_1.items.create!(name: Faker::Commerce.product_name,
                      description: Faker::Lorem.sentence,
                      price: Faker::Commerce.price,
                      image: Faker::LoremPixel.image(size: "200x211"),
                      active: true,
                      inventory: Faker::Number.number(digits: 3))
      item_2 = merchant_1.items.create!(name: Faker::Commerce.product_name,
                      description: Faker::Lorem.sentence,
                      price: Faker::Commerce.price,
                      image: Faker::LoremPixel.image(size: "200x211"),
                      active: true,
                      inventory: Faker::Number.number(digits: 3))

      merchant_2 = Merchant.create!(name: Faker::Name.unique.name,
                      address: Faker::Address.street_address,
                      city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                      zip: Faker::Address.zip)
      item_3 = merchant_2.items.create!(name: Faker::Commerce.product_name,
                      description: Faker::Lorem.sentence,
                      price: Faker::Commerce.price,
                      image: Faker::LoremPixel.image(size: "200x211"),
                      active: true,
                      inventory: Faker::Number.number(digits: 3))
      item_4 = merchant_2.items.create!(name: Faker::Commerce.product_name,
                      description: Faker::Lorem.sentence,
                      price: Faker::Commerce.price,
                      image: Faker::LoremPixel.image(size: "200x211"),
                      active: true,
                      inventory: Faker::Number.number(digits: 3))
      new_name_1 = Faker::Name.unique.name
      user_1 = User.create!(name: new_name_1,
                         address: Faker::Address.street_address,
                         city: Faker::Address.city,
                         state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip,
                         email: Faker::Internet.email(name: "#{new_name_1}"),
                          password: Faker::Internet.password(min_length: 8))

      new_name_2 = Faker::Name.unique.name
      user_2 = User.create!(name: new_name_2,
                         address: Faker::Address.street_address,
                         city: Faker::Address.city,
                         state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip,
                         email: Faker::Internet.email(name:"#{new_name_2}"),
                          password: Faker::Internet.password(min_length: 8))
      order = Order.create!(user_id: user_2.id)
      order.order_items.create!(item_id: item_1.id,
                          order_id: order.id,
                          price: item_1.price,
                          quantity: Faker::Number.number(digits: 1))
      order.order_items.create!(item_id: item_2.id,
                          order_id: order.id,
                          price: item_1.price,
                          quantity: Faker::Number.number(digits: 2))

    end
  end
end
