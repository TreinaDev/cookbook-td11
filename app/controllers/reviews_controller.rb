class ReviewsController < ApplicationController
  before_action :authenticate_user!, :set_recipe, only: %i[create new]

  def create
    params = review_params
    params[:recipe] = @recipe
    params[:user] = current_user

    @review = Review.new params

    if @review.save
      return redirect_to @recipe, notice: 'Avaliação enviada com sucesso!'
    else
      flash.now[:alert] = 'Erro ao enviar avaliação!'
      return render 'new'
    end
  end

  def new
    @review = Review.new
  end


  private

  def review_params
    params.require(:review).permit(:text, :grade)
  end

  def set_recipe
    @recipe = Recipe.find params[:recipe_id]
  end
end
