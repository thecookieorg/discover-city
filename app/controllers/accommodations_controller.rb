class AccommodationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  # GET /accommodations
  # GET /accommodations.json
  def index
    @accommodations = Accommodation.all.order("name").page(params[:page]).per(20)
    @hash = Gmaps4rails.build_markers(@accommodations) do |accommodation, marker|
      marker.lat accommodation.latitude
      marker.lng accommodation.longitude
      marker.infowindow "<h4><img src=\"#{accommodation.logo.thumb.url}\"> #{accommodation.name}</h4><p><b>Address:</b> #{accommodation.address}</p><p><b>Phone:</b> #{accommodation.phone}</p>"
      marker.json({
        name:     accommodation.name,
        address: accommodation.address
      })
    end
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
    @accommodations = Accommodation.find(params[:id])
    @hash = Gmaps4rails.build_markers(@accommodations) do |accommodation, marker|
      marker.lat accommodation.latitude
      marker.lng accommodation.longitude
      marker.infowindow "<h4><img src=\"#{accommodation.logo.thumb.url}\"> #{accommodation.name}</h4><p><b>Address:</b> #{accommodation.address}</p><p><b>Phone:</b> #{accommodation.phone}</p>"
      marker.json({
        name:     accommodation.name,
        address: accommodation.address
      })
    end
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new
  end

  # GET /accommodations/1/edit
  def edit
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(accommodation_params)

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_params
      params.require(:accommodation).permit(:name, :description, :address, :phone, :price_per_night, :free_wi_fi, :air_conditioned, :breakfast, :child_friendly, :airport_shuttle, :gym, :parking, :laundry_service, :pool, :restaurant, :hot_tub, :smoke_free, :accessible, :pets_allowed, :spa, :bar, :latitude, :longitude, :logo, :website, :facebook, :twitter, :booking_url)
    end
end
