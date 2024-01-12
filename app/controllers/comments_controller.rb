class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])

    @comment = @recipe.comments.build(comment_params)

    if @comment.save
      redirect_to recipe_path(@recipe), notice: t('.success')
    else
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
