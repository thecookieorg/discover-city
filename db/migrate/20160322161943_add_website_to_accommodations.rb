class AddWebsiteToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :website, :string
  end
end
