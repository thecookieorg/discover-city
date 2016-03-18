class WeatherLocation < ActiveRecord::Base
  belongs_to :weather_grid
  geocoded_by :city
  after_validation :geocode
end
