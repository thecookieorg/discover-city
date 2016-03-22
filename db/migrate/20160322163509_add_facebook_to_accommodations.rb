class AddFacebookToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :facebook, :string
    add_column :accommodations, :twitter, :string
  end
end
