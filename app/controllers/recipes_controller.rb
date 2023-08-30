class RecipesController < ApplicationController

  def index
  #  name_search = params.dig(:search, :search_by_name_and_description)
   # @recipes = if name_search.present?
   #           if Recipes.search_by_name_and_description(name_search).count.zero?
    #            redirect_to recipes_path(nothing: "nothing found")
    #          else
   #             Recipes.search_by_name_and_description(name_search)
   #           end
   #         else
    #          Recipe.all
  #          end
  #  @recipe = Recipe.new
    @recipes = Recipe.all

  end

end
