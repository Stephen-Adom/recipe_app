class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: recipe_food_params[:food_id],
                                  quantity: recipe_food_params[:quantity])

    puts params
    puts params[:recipe_id]
    puts recipe_food_params

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(id: params[:recipe_id]), notice: 'Recipe food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
