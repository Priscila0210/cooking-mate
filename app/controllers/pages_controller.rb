class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @recipes = current_user.recipes
    @recipe = Recipe.new
  end


  def profile
    @user = current_user

    @recipe.recipes_ingredients.build
    @recipe.recipes_diets.build


  end
end
