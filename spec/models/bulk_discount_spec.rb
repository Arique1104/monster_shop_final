require 'rails_helper'

RSpec.describe BulkDiscount do
  describe 'validations' do
    it {should validate_presence_of :name}
    it { should validate_presence_of :percent_discount}

    it {should validate_presence_of :min_purchase}


  end

  describe 'relationships' do
    it {should belong_to :merchant}
  end
end
