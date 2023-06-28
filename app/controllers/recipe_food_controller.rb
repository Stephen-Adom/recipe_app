class RecipeFoodController < ApplicationController
    def create
        @recipe_food = Recipe_food.new(params[:recipe_food])
        if @recipe_food.save
          flash[:success] = "Object added successfully"
        else
          flash[:error] = "Something went wrong"
        end
    end

    private

    def recipe_food_params
        params.require(:recipe_food).permit(:quantity)
    end
    
end
