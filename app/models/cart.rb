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
    grand_total = 0.0
    @contents.each do |item_id, quantity|
      grand_total += Item.find(item_id).price * quantity
    end
    grand_total
  end

  def count_of(item_id)
    @contents[item_id.to_s]
  end

  def subtotal_of(item_id)
    @item = Item.find(item_id)
    @quantity = @contents[item_id.to_s]


    if @discounts.count == 0
      @total_amounts = @quantity * @item.price
    else
      @discounts.each do |discount|
        if discount.merchant_id == @item.merchant_id
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
      @discounts << discount if (discount.min_purchase == quantity && discount.active == true)
    end
  end
end
