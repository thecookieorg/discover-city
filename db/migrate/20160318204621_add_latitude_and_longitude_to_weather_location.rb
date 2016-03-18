class AddLatitudeAndLongitudeToWeatherLocation < ActiveRecord::Migration
  def change
    add_column :weather_locations, :latitude, :float
    add_column :weather_locations, :longitude, :float
  end
end
