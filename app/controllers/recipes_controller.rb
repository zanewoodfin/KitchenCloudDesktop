class RecipesController < ApplicationController

  def index
    @recipes = Recipe.paginate page: params[:page]
  end

private

  def recipe_params
  end

end
