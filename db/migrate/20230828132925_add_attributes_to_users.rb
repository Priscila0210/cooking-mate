class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :age, :integer
    add_column :users, :description, :text
    add_column :users, :availability, :string
    add_column :users, :interested_in, :string
    add_column :users, :cooking_level, :string
  end
end
