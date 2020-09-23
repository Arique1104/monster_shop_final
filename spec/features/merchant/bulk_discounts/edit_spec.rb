require "rails_helper"

RSpec.describe "A merchant can edit a Bulk discount" do
  describe 'As a Merchant' do
    before :each do
      @merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)

      @m_user = @merchant_1.users.create(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@m_user)

      @item = @merchant_1.items.create!(name: "Mello", description: "Wowzer!", price: 12.50, inventory: 100, image: "https://i2.wp.com/www.cosect.net/wp-content/uploads/2019/07/wowzers-600x200.jpg?resize=600%2C200&ssl=1")

      @discount = BulkDiscount.create!(name: "5% off!", percent_discount: 5, min_purchase: 20, merchant_id: @merchant_1.id)
    end

    it 'It can edit a discount' do

      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")

      click_link "#{@discount.name}"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      click_link "Edit Discount"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}/edit")

        fill_in :name, with: "Black Friday Sale"

      click_on "Submit"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      @discount.reload
      expect(page).to have_content("Black Friday Sale")
      expect(page).to_not have_content("5% off!")

    end

    it "can expect edit show page to have prior information" do

      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")

      click_link "#{@discount.name}"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      click_link "Edit Discount"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}/edit")

      expect(page).to have_content("#{@discount.name}")
      expect(page).to have_content("#{@discount.percent_discount}")
      expect(page).to have_content("#{@discount.min_purchase}")

        fill_in :name, with: "Black Friday Sale"

      click_on "Submit"

      expect(current_path).to eq("/merchant/bulk_discounts/#{@discount.id}")

      @discount.reload
      expect(page).to have_content("Black Friday Sale")
      expect(page).to_not have_content("5% off!")

    end

  end
end
