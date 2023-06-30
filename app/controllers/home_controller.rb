class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe_types = RecipeType.all
  end
end
