class UserController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, recipe_foods: :foods).all.where(public: true)
  end
end
