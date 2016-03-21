class AddAddressToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :address, :string
  end
end
