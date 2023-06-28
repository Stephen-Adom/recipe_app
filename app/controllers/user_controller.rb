class UserController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, recipe_foods: :food).all.where(public: true)
  end
end
