class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  enum status: ['pending', 'packaged', 'shipped', 'cancelled']

  def grand_total
    merchant_ids = items.pluck(:merchant_id)

    @discounts = BulkDiscount.find_by(merchant_id: merchant_ids)

    require "pry"; binding.pry
    order_items.sum('price * quantity')
  end

  def count_of_items
    order_items.sum(:quantity)
  end

  def cancel
    update(status: 'cancelled')
    order_items.each do |order_item|
      order_item.update(fulfilled: false)
      order_item.item.update(inventory: order_item.item.inventory + order_item.quantity)
    end
  end

  def merchant_subtotal(merchant_id)
    order_items
      .joins("JOIN items ON order_items.item_id = items.id")
      .where("items.merchant_id = #{merchant_id}")
      .sum('order_items.price * order_items.quantity')
  end

  def merchant_quantity(merchant_id)
    order_items
      .joins("JOIN items ON order_items.item_id = items.id")
      .where("items.merchant_id = #{merchant_id}")
      .sum('order_items.quantity')
  end

  def is_packaged?
    update(status: 1) if order_items.distinct.pluck(:fulfilled) == [true]
  end

  def self.by_status
    order(:status)
  end

  def find_discount
    merchant_ids = items.pluck(:merchant_id)
    @discounts = BulkDiscount.find_by(merchant_id: merchant_ids)
    # x = items.joins(:merchant).joins(:bulk_discounts).where(merchant_id: merchant_ids)

    #
    #
    # item_price = items.sum(:price)
    # discounts = BulkDiscount.where(merchant_id: merchant_ids)
    # amount_off = discounts.joins(:item).where(merchant_id: merchant_ids).sum("percent_discount / item.price * 100.0")
  end
end
