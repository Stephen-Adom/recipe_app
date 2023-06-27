class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).all
  end

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipe.find(params[:id])
  end
end
