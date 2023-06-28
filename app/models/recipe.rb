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
end
