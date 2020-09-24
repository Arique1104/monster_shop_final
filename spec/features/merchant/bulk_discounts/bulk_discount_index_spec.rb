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

    it "has an index page where I see all of the discounts listed out" do
      @discount_2 = BulkDiscount.create!(name: "10% off!", percent_discount: 10, min_purchase: 15, merchant_id: @merchant_1.id)

      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")


      expect(page).to have_content("#{@discount.name}")
      expect(page).to have_content("#{@discount_2.name}")


    end

    it 'I can click a link to a bulk discount show page' do
      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")


      expect(page).to have_content("#{@discount.name}")

      click_link "#{@discount.name}"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")
    end

    it "can show multiple discounts on one page" do
      @discount_3 = BulkDiscount.create!(name: "10% off!", percent_discount: 10, min_purchase: 15, merchant_id: @merchant_1.id)
      @discount_4 = BulkDiscount.create!(name: "10% off!", percent_discount: 10, min_purchase: 15, merchant_id: @merchant_1.id)
      @discount_5 = BulkDiscount.create!(name: "10% off!", percent_discount: 10, min_purchase: 15, merchant_id: @merchant_1.id)

      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")


      expect(page).to have_content("#{@discount_3.name}")
      expect(page).to have_content("#{@discount_4.name}")
      expect(page).to have_content("#{@discount_5.name}")

    end
  end
end
