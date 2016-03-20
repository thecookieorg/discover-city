class AddCuisinesToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisines, :string
    add_column :restaurants, :cost_for_two, :string
  end
end
