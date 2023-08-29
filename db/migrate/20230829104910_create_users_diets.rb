class CreateUsersDiets < ActiveRecord::Migration[7.0]
  def change
    create_table :users_diets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
