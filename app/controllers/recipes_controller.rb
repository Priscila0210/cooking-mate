class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_recipe, only: %i[show edit update destroy]

  def new
  end



  def index
    @booking = Booking.new
    @prior_bookings = Booking.includes(:recipe)

    if params[:query].present?
      @recipes_result = Recipe.global_search("#{params[:query]}").where.not(user: current_user)


      if !@recipes_result.empty? && (params[:query].present?)
        respond_to do |format|
          format.html
          format.text { render partial: "recipes/list", locals: {recipes: @recipes_result}, formats: [:html] }
        end

      else
      #@recipes_result = Recipe.where.not(user: current_user)
        respond_to do |format|
          format.html
          format.text { render partial: "recipes/empty", formats: [:html] }
        end
      end
    else
      @recipes_result = Recipe.where.not(user: current_user)
      respond_to do |format|
        format.html
        format.text { render partial: "recipes/list", locals: {recipes: @recipes_result}, formats: [:html] }
    end
  end
end


  def edit
  end


  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @cuisine = Cuisine.find(params[:recipe][:cuisine])
    @recipe.cuisine = @cuisine

    if @recipe.save
      @ingredient_array = params[:recipe][:recipes_ingredients_attributes]["0"][:ingredient]
      @ingredient_array.each do |ingredient|
        recipes_ingredient = RecipesIngredient.new
        recipes_ingredient.ingredient = Ingredient.find(ingredient)
        recipes_ingredient.recipe = @recipe
        recipes_ingredient.save
      end
      @diet_array = params[:recipe][:recipes_diets_attributes]["0"][:diet]
      @diet_array.each do |diet|
        recipes_diet = RecipesDiet.new
        recipes_diet.diet = Diet.find(diet)
        recipes_diet.recipe = @recipe
        recipes_diet.save
      end
      redirect_to dashboard_path
    else
      render "pages/dashboard", status: :unprocessable_entity
    end

  end

  def update
    # if @recipe.update(recipe_params)
    #   redirect_to @recipe, notice: "Recipe was successfully updated.", status: :see_other
    # else
    #   render :edit, status: :unprocessable_entity
    # end

    # respond_to do |format|
      @user = current_user
      @recipe.ingredient_ids = params[:recipe][:ingredient_ids]
      @recipe.diet_ids = params[:recipe][:diet_ids]
      @recipe.cuisine_id = params[:recipe][:cuisine]
      if @recipe.update(recipe_params)
        redirect_to dashboard_path, notice: "Recipe was successfully updated.", status: :see_other
      # else
      #   render "pages/dashboard", status: :unprocessable_entity, locals: {user: @user}
      end
    # FOR OLIVIER
    #   new_ingredients = params[:recipe][:ingredient_ids].reject { |ingredient| @recipe.ingredients.pluck(:id).include?(ingredient) }
    #   add new_ingredients
    #   remove the ones that were ticked
    #  @recipe.ingredients.each do |ingredient|
    #    if !params[:recipe][:ingredients_ids].include?(ingredient)
    #      recipe.recipe_ingredients.find_by(ingredient_id: ingredient.id).destroy
    #    end
    #  end
    #  new_ingredients.each do |ingredient|
    #    if !ingredient.include?(@recipe.ingredients)
    #   recipes_ingredient.ingredient = Ingredient.find(ingredient)

      # if @recipe.update(recipe_params)
      #   # raise
      #   format.html { redirect_to dashboard_path, notice: "Recipe was successfully updated.", status: :see_other }
      #   format.json { render json: { message: "Recipe updated successfully" }, status: :ok }
      # else
      #   format.html { render "pages/dashboard", status: :unprocessable_entity }
      #   format.json { render json: @recipe.errors, status: :unprocessable_entity }
      # end
    # end
  end

  def destroy
    @recipe.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:level_of_difficulty, :title, :description, :photo) # add length
  end
end
