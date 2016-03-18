class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @weather_grids = WeatherGrid.all
    @phones = Phone.all
  end
end
