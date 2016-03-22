class AddLogoToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :logo, :string
  end
end
