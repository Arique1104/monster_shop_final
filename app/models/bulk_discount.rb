class BulkDiscount < ApplicationRecord

  belongs_to :item
  
  validates_presence_of :name, :percent_discount, :min_purchase

end
