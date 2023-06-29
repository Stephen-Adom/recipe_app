module ShoppingListHelper
  def total_price(shopping_list)
    total = 0
    shopping_list.each do |food|
      total += food['price']
    end

    total
  end
end
