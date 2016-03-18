class DropWeatherLocationsTable < ActiveRecord::Migration
  def change
    drop_table :weather_locations
  end
end
