class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @recipes = current_user.recipes
    @recipe = Recipe.new
    @recipe.recipes_ingredients.build
    @recipe.recipes_diets.build
    @mybookings = Booking.where(user_id: current_user.id)
    @my_recipes_ids = Recipe.where(user: current_user).pluck(:id)
    @my_requests = Booking.where(recipe_id: @my_recipes_ids)
    # @all_accepted_bookings = []
    # @all_accepted_bookings << @mybookings.where(status: "accepted")
    # @all_accepted_bookings << @my_requests.where(status: "accepted")

  end


  def user
    @user = current_user
    @recipe = Recipe.new
  end
end
