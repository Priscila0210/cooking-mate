class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
  end

  def new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @cuisine = Cuisine.find(params[:recipe][:cuisine])
    @recipe.cuisine = @cuisine
    if @recipe.save
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

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render json: { message: "Recipe updated successfully" }, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:recipe).permit(:level_of_difficulty, :title, :description)
  end
end
