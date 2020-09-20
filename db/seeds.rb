# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
# brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
# megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
# megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
# brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
# require "factory_bot_rails"
require "faker"

# FactoryBot.define do
#   # factory :merchant do
#   #   name { Faker::Name.unique.name }
#   #   address { Faker::Address.street_address }
#   #   city {Faker::Address.city }
#   #   state {Faker::Address.state_abbr }
#   #   zip {Faker::Address.zip }
#   # end
#   factory :user do
#     name { Faker::Name.unique.name }
#     address { Faker::Address.street_address }
#     city {Faker::Address.city }
#     state {Faker::Address.state_abbr }
#     zip {Faker::Address.zip }
#     email { Faker::Internet.email(name: "#{name}") }
#     password { Faker::Internet.password(min_length: 8) }
#   end
#   factory :item do
#     name { Faker::Commerce.product_name }
#     description { Faker::Lorem.sentence }
#     price {Faker::Commerce.price}
#     image { Faker::LoremPixel.image(size: "730x411")}
#     active {true}
#     inventory  {Faker::Number.number(digits: 3)}
#   end
#
# end


# 15.times do
#
# merchant_1 = FactoryBot.create(:merchant)
# user_1 = FactoryBot.create(:user)
# user_1.merchant_id = merchant_1.id
#
# user_2 = FactoryBot.create(:user)
# item_1 = FactoryBot.create(:item, merchant_id: merchant_1.id)
# item_2 = FactoryBot.create(:item, merchant_id: merchant_1.id)
# item_3 = FactoryBot.create(:item, merchant_id: merchant_1.id)
#
# order_1 = Order.create!(user_id: user_2.id)
#
# OrderItem.create!(order_id: order_1.id, item_id: item_3.id, price: item_3.price)
#
# OrderItem.create!(order_id: order_1.id, item_id: item_2.id, price: item_2.price)
#
# OrderItem.create!(order_id: order_1.id, item_id: item_1.id, price: item_1.price)
#
# order_2 = Order.create!(user_id: user_1.id)
#
#
# merchant_2 = FactoryBot.create(:merchant)
# user_3 = FactoryBot.create(:user)
# user_2.merchant_id = merchant_2.id
#
# user_4 = FactoryBot.create(:user)
# item_4 = FactoryBot.create(:item, merchant_id: merchant_2.id)
# item_5 = FactoryBot.create(:item, merchant_id: merchant_2.id)
# item_6 = FactoryBot.create(:item, merchant_id: merchant_2.id)
#
# order_2 = Order.create!(user_id: user_4.id)
#
# OrderItem.create!(order_id: order_2.id, item_id: item_4.id, price: item_4.price)
#
# OrderItem.create!(order_id: order_2.id, item_id: item_5.id, price: item_5.price)
#
# OrderItem.create!(order_id: order_2.id, item_id: item_6.id, price: item_6.price)
# end


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
                      image: Faker::LoremPixel.image(size: "730x411"),
                      active: true,
                      inventory: Faker::Number.number(digits: 3))
      item_2 = merchant_1.items.create!(name: Faker::Commerce.product_name,
                      description: Faker::Lorem.sentence,
                      price: Faker::Commerce.price,
                      image: Faker::LoremPixel.image(size: "730x411"),
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
                      image: Faker::LoremPixel.image(size: "730x411"),
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
