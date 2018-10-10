require "pry"

class CashRegister
  
  attr_accessor :discount, :total, :items, :last_item
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
    @last_item = {}
  end
  
  def add_item(item, item_price, quantity = 1)
    self.total += (item_price * quantity)
    quantity.times do 
      self.items << item
    end 
    self.last_item["item"] = item
    self.last_item["item_price"] = item_price
    self.last_item["quantity"] = quantity
  end 
  
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else 
      self.total *= (1-(self.discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    end 
  end 
  
  def void_last_transaction
    self.total -= self.last_item["item_price"]
    self.items.delete(self.last_item["item"])
  end 
end 