class CashRegister
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quant = 1)
    @last_item = [title, price, quant]
    quant.times {@items << @last_item[0]}
    self.total += @last_item[1] * @last_item[2]
  end

  def apply_discount
    if self.discount.nil?
      "There is no discount to apply."
    else
      self.total = (self.total * (100 - self.discount.to_f) / 100).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    @last_item[2].times {@items.pop}
    self.total -= @last_item[1] * @last_item[2]
  end
end
