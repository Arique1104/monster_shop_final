# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tim = Merchant.create!(name: "Tim's Yah82cit", address: "Turing", city: "Denver", state: "CO", zip: 80218)

    tim.items.create!(name: "Yah82cit", description: "You hate to see it!", price: 20, image: "https://www.behavioraleconomics.com/wp-content/uploads/2015/11/old-woman-laughing.jpeg", active: true, inventory: 45)
    tim.items.create!(name: "Yah82cit", description: "You hate to see it!", price: 25, image: "https://www.behavioraleconomics.com/wp-content/uploads/2015/11/old-woman-laughing.jpeg", active: true, inventory: 4)

    tim.bulk_discounts.create!(name: "Try it out!", percent_discount: 10, min_purchase: 2)

arique = Merchant.create!(name: "Arique's Thought Shop", address: "1234 Division St.", city: "Chicago", state: "IL", zip: 60651)
    arique.items.create!(name: "Confidence", description: "You're only as confident as you allow yourself!", price: 100, image: "https://pbs.twimg.com/profile_images/1734721280/old.jpg", active: true, inventory: 80)
    arique.items.create!(name: "Joy", description: "Stability is the only gift you can try and give yourself again.", price: 100, image: "https://pbs.twimg.com/profile_images/1734721280/old.jpg", active: true, inventory: 80)

    arique.bulk_discounts.create!(name: "You Deserve It", percent_discount: 75, min_purchase: 8)
    arique.bulk_discounts.create!(name: "For someone You Care For", percent_discount: 50, min_purchase: 7)


maribel = Merchant.create!(name: "Maribel's Prayer Shop", address: "4321 Central Ave.", city: "Chicago", state: "IL", zip: 60606)

    maribel.items.create!(name: "The Lord's Prayer", description: "The Lord is my guide", price: 1, image: "https://i.pinimg.com/236x/52/b5/f2/52b5f2ef7a9189afd35d8a180d406683--photo-pic-old-age.jpg", active: true, inventory: 80)
    maribel.items.create!(name: "Annointing Oil", description: "For all prayer needs", price: 1, image: "https://i.pinimg.com/236x/52/b5/f2/52b5f2ef7a9189afd35d8a180d406683--photo-pic-old-age.jpg", active: true, inventory: 80)

    maribel.bulk_discounts.create!(name: "Tithe", percent_discount: 10, min_purchase: 10)

getulio = Merchant.create!(name: "Getulio's Lock Shop", address: "9087 Armitage St.", city: "Chicago", state: "IL", zip: 60647)

    getulio.items.create!(name: "Don't Get Locked Out!", description: "Subscription To Emergency Locksmith Needs", price: 300, image: "https://i.pinimg.com/236x/b9/22/dc/b922dc95b2f612a470a0b4540e9dc13e--irving-penn-portrait-male-faces.jpg", active: true, inventory: 80)
    getulio.items.create!(name: "New Lock", description: "Front Gate Lock", price: 375, image: "https://i.pinimg.com/236x/b9/22/dc/b922dc95b2f612a470a0b4540e9dc13e--irving-penn-portrait-male-faces.jpg", active: true, inventory: 80)

    getulio.bulk_discounts.create!(name: "Don't get locked out", percent_discount: 10, min_purchase: 10)

wilmer = Merchant.create!(name: "Wilmer's Fortnite Extravaganza", address: "7503 Cannon Valley Place", city: "Northfield", state: "MN", zip: 55057)

    wilmer.items.create!(name: "Victory Royale #1", description: "Get in for the win!", price: 89, image: "https://i.pinimg.com/236x/45/6b/1f/456b1f0ee7ff96dcff1436f920df6457--male-portraits-character-portraits.jpg", active: true, inventory: 100)
    wilmer.items.create!(name: "Practice Mode", description: "Get. Better. Period.", price: 375, image: "https://i.pinimg.com/236x/45/6b/1f/456b1f0ee7ff96dcff1436f920df6457--male-portraits-character-portraits.jpg", active: true, inventory: 80)

    wilmer.bulk_discounts.create!(name: "First Time Buyers!", percent_discount: 10, min_purchase: 1)

lasondra = Merchant.create!(name: "Lasondra's Art Shop", address: "3456 South Side Street", city: "Chicago", state: "IL", zip: 60606)

    lasondra.items.create!(name: "Tutor", description: "Exercise your brain", price: 15, image: "https://i.pinimg.com/236x/ff/13/cb/ff13cb19185a02caeccdc32c28ec7b92--year-old-farmers.jpg", active: true, inventory: 100)
    lasondra.items.create!(name: "Artist Consultant Session", description: "Get. Better. Period.", price: 700, image: "https://i.pinimg.com/236x/ff/13/cb/ff13cb19185a02caeccdc32c28ec7b92--year-old-farmers.jpg", active: true, inventory: 80)

    lasondra.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)

hillary = Merchant.create!(name: "Hillary's Party Shop", address: "5678 South Reading Street", city: "Minneapolis", state: "MN", zip: 55057)

    hillary.items.create!(name: "Tutor", description: "Exercise your brain", price: 15, image: "https://i.pinimg.com/236x/10/b4/e0/10b4e0bd88dd53c356b54749baac4cc2--life-s-old-age.jpg", active: true, inventory: 100)
    hillary.items.create!(name: "Loving Soul", description: "Get. Better. Period.", price: 700, image: "https://i.pinimg.com/236x/10/b4/e0/10b4e0bd88dd53c356b54749baac4cc2--life-s-old-age.jpg", active: true, inventory: 80)

    hillary.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)

ed = Merchant.create!(name: "Ed's Golf Shop", address: "12345 Caring Ave", city: "Raleigh", state: "NC", zip: 27601)

    ed.items.create!(name: "Care Giver", description: "Give when you can, but take no shit", price: 15, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTPbvHJbubxaTgiNRD27_LVfe3sCPGtv1KGfw&usqp=CAU", active: true, inventory: 100)
    ed.items.create!(name: "Cold Wisdom", description: "Get. Better. Period.", price: 700, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTPbvHJbubxaTgiNRD27_LVfe3sCPGtv1KGfw&usqp=CAU", active: true, inventory: 80)

    ed.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)

jackie = Merchant.create!(name: "Jackie's Astronaut Training", address: "1234 University Road", city: "Urbana Champagne", state: "IL", zip: 61820)

    jackie.items.create!(name: "I'm an Astro Engineer", description: "I'm in a sorority now!", price: 15, image: "https://i.pinimg.com/236x/e9/11/76/e911763e56986bc92cdfbdbbdf16e58e--homeless-people-white-photography.jpg", active: true, inventory: 100)
    jackie.items.create!(name: "Cold Wisdom", description: "Get. Better. Period.", price: 700, image: "https://i.pinimg.com/236x/e9/11/76/e911763e56986bc92cdfbdbbdf16e58e--homeless-people-white-photography.jpg", active: true, inventory: 80)

    jackie.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)

priya = Merchant.create!(name: "Priya's Personal Power Inc.", address: "1234 Shine", city: "Denver", state: "CO", zip: 80016)

    priya.items.create!(name: "Become Your Best Self!", description: "One trusting step at a time", price: 15, image: "https://i.pinimg.com/originals/a9/23/e5/a923e57cf47eff4c5a50258a3243d1c2.jpg", active: true, inventory: 100)
    priya.items.create!(name: "Cold Wisdom", description: "Get. Better. Period.", price: 700, image: "https://i.pinimg.com/originals/a9/23/e5/a923e57cf47eff4c5a50258a3243d1c2.jpg", active: true, inventory: 80)

    priya.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)

ricky = Merchant.create!(name: "Ricky's This Ain't a Cult it's Socialism Shop & Farm", address: "1234 Cult Drive", city: "Denver", state: "CO", zip: 80016)

    ricky.items.create!(name: "It's not a cult, I promise!", description: "It might still be a cult", price: 15, image: "https://cdn.tutsplus.com/photo/uploads/legacy/363_oldgeneration/pt-seniors-3.jpg", active: true, inventory: 100)
    ricky.items.create!(name: "Cold Wisdom", description: "Get. Better. Period.", price: 700, image: "https://cdn.tutsplus.com/photo/uploads/legacy/363_oldgeneration/pt-seniors-3.jpg", active: true, inventory: 80)

    ricky.bulk_discounts.create!(name: "Try it!  You deserve it!", percent_discount: 10, min_purchase: 1)


    merchant_user = User.create!(name: "Arique", address: "1234 Drive", city: "Chicago", state: "IL", zip: "60651", email: "arique@merchant.com", password: "securepassword", role: 1)

    regular_user = User.create!(name: "Arique", address: "1234 Drive", city: "Chicago", state: "IL", zip: "60651", email: "arique@regular.com", password: "securepassword", role: 0)








# User.create!(name: "Arique", address: "123 Fake St", city: "Chicago", state: "IL", zip: "60606", email: "arique@example.com", password: "securepassword", role: 1, merchant_id: megan.id)
# require "factory_bot_rails"
# require "faker"
#
# # FactoryBot.define do
# #   # factory :merchant do
# #   #   name { Faker::Name.unique.name }
# #   #   address { Faker::Address.street_address }
# #   #   city {Faker::Address.city }
# #   #   state {Faker::Address.state_abbr }
# #   #   zip {Faker::Address.zip }
# #   # end
# #   factory :user do
# #     name { Faker::Name.unique.name }
# #     address { Faker::Address.street_address }
# #     city {Faker::Address.city }
# #     state {Faker::Address.state_abbr }
# #     zip {Faker::Address.zip }
# #     email { Faker::Internet.email(name: "#{name}") }
# #     password { Faker::Internet.password(min_length: 8) }
# #   end
# #   factory :item do
# #     name { Faker::Commerce.product_name }
# #     description { Faker::Lorem.sentence }
# #     price {Faker::Commerce.price}
# #     image { Faker::LoremPixel.image(size: "730x411")}
# #     active {true}
# #     inventory  {Faker::Number.number(digits: 3)}
# #   end
# #
# # end
#
#
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
#
#
# #create merchant & items
#     # 15.times do
#     #   merchant_1 = Merchant.create!(name: Faker::Name.unique.name,
#     #                   address: Faker::Address.street_address,
#     #                   city: Faker::Address.city,
#     #                   state: Faker::Address.state_abbr,
#     #                   zip: Faker::Address.zip)
#     #   item_1 = merchant_1.items.create!(name: Faker::Commerce.product_name,
#     #                   description: Faker::Lorem.sentence,
#     #                   price: Faker::Commerce.price,
#     #                   image: Faker::LoremPixel.image(size: "730x411"),
#     #                   active: true,
#     #                   inventory: Faker::Number.number(digits: 3))
#     #   item_2 = merchant_1.items.create!(name: Faker::Commerce.product_name,
#     #                   description: Faker::Lorem.sentence,
#     #                   price: Faker::Commerce.price,
#     #                   image: Faker::LoremPixel.image(size: "730x411"),
#     #                   active: true,
#     #                   inventory: Faker::Number.number(digits: 3))
#     #
#     #   merchant_2 = Merchant.create!(name: Faker::Name.unique.name,
#     #                   address: Faker::Address.street_address,
#     #                   city: Faker::Address.city,
#     #                   state: Faker::Address.state_abbr,
#     #                   zip: Faker::Address.zip)
#     #   item_3 = merchant_2.items.create!(name: Faker::Commerce.product_name,
#     #                   description: Faker::Lorem.sentence,
#     #                   price: Faker::Commerce.price,
#     #                   image: Faker::LoremPixel.image(size: "730x411"),
#     #                   active: true,
#     #                   inventory: Faker::Number.number(digits: 3))
#     #   item_4 = merchant_2.items.create!(name: Faker::Commerce.product_name,
#     #                   description: Faker::Lorem.sentence,
#     #                   price: Faker::Commerce.price,
#     #                   image: Faker::LoremPixel.image(size: "200x211"),
#     #                   active: true,
#     #                   inventory: Faker::Number.number(digits: 3))
#     #   new_name_1 = Faker::Name.unique.name
#     #   user_1 = User.create!(name: new_name_1,
#     #                      address: Faker::Address.street_address,
#     #                      city: Faker::Address.city,
#     #                      state: Faker::Address.state_abbr,
#     #                      zip: Faker::Address.zip,
#     #                      email: Faker::Internet.email(name: "#{new_name_1}"),
#     #                       password: Faker::Internet.password(min_length: 8))
#     #
#     #   new_name_2 = Faker::Name.unique.name
#     #   user_2 = User.create!(name: new_name_2,
#     #                      address: Faker::Address.street_address,
#     #                      city: Faker::Address.city,
#     #                      state: Faker::Address.state_abbr,
#     #                      zip: Faker::Address.zip,
#     #                      email: Faker::Internet.email(name:"#{new_name_2}"),
#     #                       password: Faker::Internet.password(min_length: 8))
#     #   order = Order.create!(user_id: user_2.id)
#     #   order.order_items.create!(item_id: item_1.id,
#     #                       order_id: order.id,
#     #                       price: item_1.price,
#     #                       quantity: Faker::Number.number(digits: 1))
#     #   order.order_items.create!(item_id: item_2.id,
#     #                       order_id: order.id,
#     #                       price: item_1.price,
#     #                       quantity: Faker::Number.number(digits: 2))
#     #
#     # end
