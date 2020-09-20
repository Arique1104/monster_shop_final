class AddActiveToBulkDiscount < ActiveRecord::Migration[5.2]
  def change
    add_column :bulk_discounts, :active, :boolean, default: false
  end
end
