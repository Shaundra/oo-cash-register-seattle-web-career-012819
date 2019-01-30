require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    quantity.downto(1) do |item|
      @total += price
      @items << title
      @last_item_price = price
    end
  end

  def apply_discount
    if @discount
      @total *= (100 - @discount) / 100.0
      @total = @total.round
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end
end
