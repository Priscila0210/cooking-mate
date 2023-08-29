class AddNameToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :title, :string
  end
end
