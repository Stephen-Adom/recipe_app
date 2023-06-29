class RecipeFood < ApplicationRecord
  # Associations
  belongs_to :recipe
  belongs_to :food

  # Validations
  validates :food_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}
end
