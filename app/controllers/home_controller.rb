class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe_types = RecipeType.all
    if current_user
      @favorite_recipes = current_user.favorite_recipes.order(created_at: :desc).limit 5
    end
  end
end
