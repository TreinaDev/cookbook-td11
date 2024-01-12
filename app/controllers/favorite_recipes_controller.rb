class FavoriteRecipesController < ApplicationController
  def create
    recipe = Recipe.find_by(id: params[:recipe_id])
    favorite_recipe = FavoriteRecipe.new(recipe:, user: current_user)
    if favorite_recipe.save
      return redirect_to root_path, alert: "Receita #{recipe.title} favoritada com sucesso"
    else
      return redirect_to root_path, alert: 'Não foi possível favoritar a receita'
    end
  end

  def index
    @favorite_recipes = current_user.favorite_recipes
  end
end
