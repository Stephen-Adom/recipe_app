module UserHelper
  def total_food_price(recipe_foods)
    recipe_foods.sum { |recipe| recipe.food.price }
  end
end
