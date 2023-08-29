class CreateRecipesDiets < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_diets do |t|
      t.references :diet, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
