class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :cook_time, :ingredients, :instructions, presence: true
end
