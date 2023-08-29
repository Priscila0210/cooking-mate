class CreateUsersCuisines < ActiveRecord::Migration[7.0]
  def change
    create_table :users_cuisines do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cuisine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
