class RecipeFood < ApplicationRecord
  # Associations
  belongs_to :recipe
  belongs_to :food

  # Validations
  validates :quantity, numericality: { greater_than: 0, less_then: 5 }
end
