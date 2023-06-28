class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: recipe_food_params[:food_id],
                                  quantity: recipe_food_params[:quantity])

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(id: params[:recipe_id]), notice: 'Recipe food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    respond_to do |format|
      if @recipe_food.update(
        recipe_id: params[:recipe_id], food_id: recipe_food_params[:food_id],
        quantity: recipe_food_params[:quantity]
      )
        format.html { redirect_to recipe_path(id: params[:recipe_id]), notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Recipe Food was successfully destroyed.' } if @recipe_food.destroy
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
