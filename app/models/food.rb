class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: { only_integer: true }
end
