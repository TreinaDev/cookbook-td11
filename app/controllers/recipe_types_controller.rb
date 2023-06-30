class RecipeTypesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new index]
  before_action :authorize_user, only: %i[create new index]

  def index
    @recipe_types = RecipeType.all
  end

  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.where(recipe_type: @recipe_type)
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)
    if @recipe_type.save
      flash[:notice] = t('.success')
      redirect_to recipe_types_path
    else
      @recipe_type = RecipeType.new
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end

  def authorize_user
    return redirect_to root_path unless current_user.admin?
  end
end
