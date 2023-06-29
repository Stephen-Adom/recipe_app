require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :all do
    @user = User.create(name: 'Jhon', email: 'example@abc.com', password: 'sec123', confirmed_at: DateTime.now)
    @recipe = Recipe.create(name: 'paratha', preparation_time: 2, cooking_time: 2, description: 'anything we want',
                            user_id: @user.id)
    @food = Food.create(name: 'apple', measurement_unit: 'kilogram', price: 12, quantity: 2, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'should print the parameter value of Recipe Food' do
    expect(@recipe_food.quantity).to eq(2)
  end

  it 'Should have association with Recipe And Food' do
    expect(@recipe_food.recipe_id).to eq(@recipe.id)
    expect(@recipe_food.food_id).to eq(@food.id)
  end

  describe 'model RecipeFood Validation' do
    it 'quantity should not be nil' do
      @recipe_food.quantity = nil
      expect(@recipe_food).not_to be_valid
    end

    it 'quantity should not be empty' do
      @recipe_food.quantity = ''
      expect(@recipe_food).not_to be_valid
    end

    it 'quantity should not be less than 0' do
      @recipe_food.quantity = -5
      expect(@recipe_food).not_to be_valid
    end

    it 'quantity should not be equal to 0' do
      @recipe_food.quantity = 0
      expect(@recipe_food).not_to be_valid
    end
  end
end
