class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).all
  end

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(
      user_id: current_user.id, 
      name:recipe_params[:name],
      description:recipe_params[:description],
      cooking_time:recipe_params[:cooking_time],
      preparation_time:recipe_params[:preparation_time]
    )

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time)
  end
end
