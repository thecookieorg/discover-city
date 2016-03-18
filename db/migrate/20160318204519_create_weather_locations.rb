class CreateWeatherLocations < ActiveRecord::Migration
  def change
    create_table :weather_locations do |t|
      t.references :weather_grid, index: true, foreign_key: true
      t.string :city

      t.timestamps null: false
    end
  end
end
