class Recipe < ApplicationRecord
  # association
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  # validation
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :cooking_time, numericality: { greater_than: 0 }

  def shopping_list(current_user)
    shopping_list = []
    user_food_list = Food.where(user_id: current_user.id).all

    recipe_foods.each do |recipe_food|
      food = user_food_list.find_by(id: recipe_food.food_id)

      next unless !user_food_list.include?(recipe_food.food) || recipe_food.quantity > food.quantity

      shopping_list << {
        **food.attributes,
        quantity: recipe_food.quantity - food.quantity
      }
    end

    shopping_list
  end
end
