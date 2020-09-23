require "rails_helper"

RSpec.describe "A merchant can create a new Bulk discount" do
  describe "As a merchant" do
    before :each do
      @merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)

      @m_user = @merchant_1.users.create(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@m_user)

      @item = @merchant_1.items.create!(name: "Mello", description: "Wowzer!", price: 12.50, inventory: 100, image: "https://i2.wp.com/www.cosect.net/wp-content/uploads/2019/07/wowzers-600x200.jpg?resize=600%2C200&ssl=1")

    end
    it "has a link to create a new bulk discount" do
      visit "/merchant"

      click_link 'My Bulk Discounts'

      expect(current_path).to eq("/merchant/bulk_discounts")

      click_link "Create New Discount"
      expect(current_path).to eq("/merchant/bulk_discounts/new")

      fill_in :name, with: "Labor Day Sale"
      fill_in :percent_discount, with: 10
      fill_in :min_purchase, with: 10

      click_button "Submit"

      expect(current_path).to eq("/merchant/bulk_discounts")

      expect(page).to have_content("Labor Day Sale")
    end
  end

end
