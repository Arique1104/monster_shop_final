require 'rails_helper'

RSpec.describe BulkDiscount do
  describe 'validations' do
    it {should validate_presence_of :name}
    it { should validate_presence_of :percent_discount}

    it {should validate_presence_of :min_purchase}


  end
  describe 'relationships' do
    it {should belong_to :item}
  end
  # five_percent_discount = BulkDiscount.create!(name: "5% off!",
  # percent_discount: 5,
  # min_purchase: 20,
  # merchant_id: @merchant_1.id)
  end
