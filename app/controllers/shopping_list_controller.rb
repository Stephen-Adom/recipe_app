class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:recipe_id])

    @shopping_list = @recipe.shopping_list(current_user)

    @recipe.shopping_list(current_user).each do |list|
      puts list['price'].class
    end
  end
end
