class UserController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, recipe_foods: :food).all.where(public: true).order(created_at: :desc)
  end
end
