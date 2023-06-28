class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).all.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(
      user_id: current_user.id,
      name: recipe_params[:name],
      description: recipe_params[:description],
      cooking_time: recipe_params[:cooking_time],
      preparation_time: recipe_params[:preparation_time]
    )

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(public: params.require(:recipe)[:public])
        format.turbo_stream { flash.now[:notice] = 'Recipe was successfully updated.' }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time)
  end
end
