require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'New Merchant Bulk Discount' do
  describe 'As a Merchant' do
    before :each do
      @merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)

      @m_user = @merchant_1.users.create(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@m_user)

      @item = @merchant_1.items.create!(name: "Mello", description: "Wowzer!", price: 12.50, inventory: 100, image: "https://i2.wp.com/www.cosect.net/wp-content/uploads/2019/07/wowzers-600x200.jpg?resize=600%2C200&ssl=1")

      @discount = BulkDiscount.create!(name: "5% off!", percent_discount: 5, min_purchase: 20, merchant_id: @merchant_1.id)
    end

    it 'It can present a show page for a discount' do

      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")

      click_link "#{@discount.name}"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      expect(page).to have_content("#{@discount.name}")
      expect(page).to have_content("#{@discount.percent_discount}")
      expect(page).to have_content("#{@discount.min_purchase}")

    end

    it "a Merchant can activate and deactivate" do
      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")

      expect(page).to have_content("#{@discount.name}")

      click_link "#{@discount.name}"
      expect(page).to have_content("#{@discount.percent_discount}")
      expect(page).to have_content("#{@discount.min_purchase}")
      expect(@discount.active).to eq(false)
      click_on "Activate"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      @discount.reload
      expect(@discount.active).to eq(true)

      click_on "Deactivate"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      @discount.reload
      expect(@discount.active).to eq(false)
    end

  #   it 'I can create an  item for a merchant' do
  #     name = 'Ogre'
  #     description = "I'm an Ogre!"
  #     price = 20
  #     image = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw'
  #     inventory = 5
  #
  #     visit "/merchant/items/new"
  #
  #     fill_in 'Name', with: name
  #     fill_in 'Description', with: description
  #     fill_in 'Price', with: price
  #     fill_in 'Image', with: image
  #     fill_in 'Inventory', with: inventory
  #     click_button 'Create Item'
  #
  #     expect(current_path).to eq("/merchant/items")
  #     expect(page).to have_link(name)
  #     expect(page).to have_content(description)
  #     expect(page).to have_content("Price: #{number_to_currency(price)}")
  #     expect(page).to have_content("Active")
  #     expect(page).to have_content("Inventory: #{inventory}")
  #   end
  #
  #   it 'I can not create an  item for a merchant with an incomplete form' do
  #     name = 'Ogre'
  #
  #     visit "/merchant/items/new"
  #
  #     fill_in 'Name', with: name
  #     click_button 'Create Item'
  #
  #     expect(page).to have_content("description: [\"can't be blank\"]")
  #     expect(page).to have_content("price: [\"can't be blank\"]")
  #     expect(page).to have_content("image: [\"can't be blank\"]")
  #     expect(page).to have_content("inventory: [\"can't be blank\"]")
  #     expect(page).to have_button('Create Item')
    # end
  end
end
