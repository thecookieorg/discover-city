class AddBookingUrlToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :booking_url, :string
  end
end
