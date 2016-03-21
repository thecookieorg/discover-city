class AddPhoneToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :phone, :string
  end
end
