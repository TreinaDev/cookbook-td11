class Recipe < ApplicationRecord
  has_many :comments
  belongs_to :recipe_type
  belongs_to :user
  validates :title, :cook_time, :ingredients, :instructions, presence: true
end
