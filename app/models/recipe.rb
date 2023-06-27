class Recipe < ApplicationRecord
  # association
  belongs_to :user
  
  # validation
  validates :name, presence:true
  validates :description, presence:true
  validates :preparation_time, numericality:true
  validates :cooking_time, numericality:true
end
