class CreateBulkDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bulk_discounts do |t|
      t.string :name
      t.integer :percent_discount
      t.integer :min_purchase

      t.timestamps
    end
  end
end
