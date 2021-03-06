class RestaurantsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all.order(:cached_votes_up => :desc).page(params[:page]).per(20)
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow "<h4><img src=\"#{restaurant.logo.thumb.url}\"> #{restaurant.name}</h4><p><b>Address:</b> #{restaurant.address}</p><p><b>Phone:</b> #{restaurant.phone_number}</p><p><b>Monday:</b> #{restaurant.monday_hours}</p><p><b>Tuesday:</b> #{restaurant.tuesday_hours}</p><p><b>Wednesday:</b> #{restaurant.wednesday_hours}</p><p><b>Thursday:</b> #{restaurant.thursday_hours}</p><p><b>Friday:</b> #{restaurant.friday_hours}</p><p><b>Saturday:</b> #{restaurant.saturday_hours}</p><p><b>Sunday:</b> #{restaurant.sunday_hours}</p>"
      marker.json({
        name:     restaurant.name,
        address: restaurant.address
      })
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurants = Restaurant.find(params[:id])
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow "<h4><img src=\"#{restaurant.logo.thumb.url}\"> #{restaurant.name}</h4><p><b>Address:</b> #{restaurant.address}</p><p><b>Phone:</b> #{restaurant.phone_number}</p><p><b>Monday:</b> #{restaurant.monday_hours}</p><p><b>Tuesday:</b> #{restaurant.tuesday_hours}</p><p><b>Wednesday:</b> #{restaurant.wednesday_hours}</p><p><b>Thursday:</b> #{restaurant.thursday_hours}</p><p><b>Friday:</b> #{restaurant.friday_hours}</p><p><b>Saturday:</b> #{restaurant.saturday_hours}</p><p><b>Sunday:</b> #{restaurant.sunday_hours}</p>"
      marker.json({
        name:     restaurant.name,
        address: restaurant.address
      })
    end
  end

  # GET /restaurants/new
  def new
    #@restaurant = Restaurant.new
    @restaurant = current_user.restaurants.build
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @restaurant.upvote_from current_user
    redirect_to restaurants_path, notice: 'You rock! Thank you for voting!'
  end

  def downvote
    @restaurant.downvote_from current_user
    redirect_to restaurants_path, notice: 'You rock! Thank you for voting!'
  end

  private
   
    
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :description, :phone_number, :website, :order_online, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :facebook, :twitter, :instagram, :latitude, :longitude, :logo, :cuisines, :cost_for_two)
    end
end
