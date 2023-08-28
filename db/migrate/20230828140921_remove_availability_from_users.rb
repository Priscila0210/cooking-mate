class RemoveAvailabilityFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :availability, :string
    add_column :users, :availability, :string, array:true, default: []
  end
end
