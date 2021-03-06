require 'rails_helper'

RSpec.describe "Add Items to Cart" do
  describe "As a Visitor" do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
      @hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
    end

    it "I can add an item from the items show page" do
      visit item_path(@ogre)

      click_button 'Add to Cart'

      expect(current_path).to eq(items_path)
      expect(page).to have_content("#{@ogre.name} has been added to your cart!")
      expect(page).to have_content("Cart: 1")
    end

    it "I can add multiple items from the items show page" do
      visit item_path(@ogre)

      click_button 'Add to Cart'

      visit item_path(@giant)

      click_button 'Add to Cart'

      expect(page).to have_content("#{@giant.name} has been added to your cart!")
      expect(page).to have_content("Cart: 2")
    end

    it "Test for cart with normal quantity that adds more item to meet discount and shows new discount" do
      @discount_1 = @megan.bulk_discounts.create!(name: "Labor Day Sale", percent_discount: 10, min_purchase: 2, active: true)

      visit item_path(@ogre)

      click_button 'Add to Cart'

      expect(current_path).to eq(items_path)

      click_on "Cart: 1"

      expect(page).to have_content("Total: $20.00")

      click_button "More of This!"

      expect(page).to have_content("Quantity: 2")

      expect(page).to have_content("Total: $36.00")

      click_button "More of This!"

      expect(page).to have_content("Quantity: 3")

      expect(page).to have_content("Total: $54.00")

    end

    it "Test for a cart with items from at least 2 different merchants. One has a discount. Discount only applies to the item from merchant (that meets minimum quantities)" do
      @discount_1 = @megan.bulk_discounts.create!(name: "Labor Day Sale", percent_discount: 10, min_purchase: 2, active: true)

      visit item_path(@ogre)

      click_button 'Add to Cart'

      expect(current_path).to eq(items_path)

      visit item_path(@hippo)

      click_button 'Add to Cart'

      click_on "Cart: 2"
      expect(page).to have_content("Total: $70.00")
      expect(page).to have_content("Cart: 2")

      within "#item-#{@ogre.id}" do
      click_button "More of This!"
      end
      
      expect(page).to have_content("Cart: 3")
      expect(page).not_to have_content("Total: $90.00")
      expect(page).to have_content("Total: $86.00")

    end
  end
end
