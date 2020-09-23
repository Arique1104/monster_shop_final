require "bulk_discount"
class Cart
  attr_reader :contents, :discounts

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
    @discounts = []
    find_discount
  end

  def add_item(item_id)
    @contents[item_id] += 1
  end

  def less_item(item_id)
    @contents[item_id] -= 1
  end

  def count
    @contents.values.sum
  end

  def items
    @contents.map do |item_id, _|
      Item.find(item_id)
    end
  end

  def grand_total
    grand_totals = 0.0
    if @discounts.count == 0
      @contents.each do |item_id, quantity|
        grand_totals += Item.find(item_id).price * quantity
      end
    else
      @discounts.each do |discount|
        @contents.each do |item_id, quantity|
          item = Item.find(item_id)
          if discount.merchant_id == item.merchant_id
            amount_off = (discount.percent_discount/100.0) * (quantity * item.price)
            grand_totals += (item.price * quantity) - amount_off
          else
            grand_totals += item.price * quantity
          end
        end
      end
    end
    grand_totals
  end

  def count_of(item_id)
    @contents[item_id.to_s]
  end

  def subtotal_of(item_id)
    @item = Item.find(item_id)
    @quantity = @contents[item_id.to_s]

    if @discounts.count == 0
      @total_amount = @quantity * @item.price
    end

    if @discounts.count != 0
      @discounts.each do |discount|
        if discount.merchant_id != @item.merchant_id
          @total_amount = @quantity * @item.price
        else discount.merchant_id == @item.merchant_id
          amount_off = (discount.percent_discount/100.0) * (@quantity * @item.price)
          @total_amount = (@quantity * @item.price) - amount_off
        end
      end
    end
    @total_amount
  end

  def limit_reached?(item_id)
    count_of(item_id) == Item.find(item_id).inventory
  end

  def find_discount
    @contents.each do |item, quantity|
      @item = Item.find(item.to_i)
      discount = BulkDiscount.find_by(merchant_id: @item.merchant.id)
      if !discount.nil?
        @discounts << discount if (discount.min_purchase == quantity && discount.active == true)
      end
    end
  end
end
