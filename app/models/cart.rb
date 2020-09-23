class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
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
    @contents.each do |item_string, quantity|
      item = Item.find(item_string.to_i)
      if find_discount(item, quantity).exists?
        amount_off = (@discount.first.percent_discount/100.0) * (quantity * item.price)
        grand_totals += (item.price * quantity) - amount_off
      else
        grand_totals += item.price * quantity
      end
    end
    grand_totals
  end

  def count_of(item_id)
    @contents[item_id.to_s]
  end

  def subtotal_of(item_id)
    @contents[item_id.to_s] * Item.find(item_id).price
  end

  def limit_reached?(item_id)
    count_of(item_id) == Item.find(item_id).inventory
  end

  def find_discount(item, quantity)
      @discount = BulkDiscount.where(merchant_id: item.merchant_id).where("min_purchase <= #{quantity}").order(:percent_discount).limit(1)
  end

end
