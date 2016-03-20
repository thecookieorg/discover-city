class LiquorStoresController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_liquor_store, only: [:show, :edit, :update, :destroy]

  # GET /liquor_stores
  # GET /liquor_stores.json
  def index
    @liquor_stores = LiquorStore.all.order("name").page(params[:page]).per(20)
    @hash = Gmaps4rails.build_markers(@liquor_stores) do |liquor_store, marker|
      marker.lat liquor_store.latitude
      marker.lng liquor_store.longitude
      marker.infowindow "<h4><img src=\"#{liquor_store.logo.thumb.url}\"> #{liquor_store.name}</h4><p><b>Address:</b> #{liquor_store.address}</p><p><b>Phone:</b> #{liquor_store.phone}</p>"
      marker.json({
        name:     liquor_store.name,
        address: liquor_store.address
      })
    end
  end

  # GET /liquor_stores/1
  # GET /liquor_stores/1.json
  def show
    @liquor_stores = LiquorStore.find(params[:id])
    @hash = Gmaps4rails.build_markers(@liquor_stores) do |liquor_store, marker|
      marker.lat liquor_store.latitude
      marker.lng liquor_store.longitude
      marker.infowindow "<h4><img src=\"#{liquor_store.logo.thumb.url}\"> #{liquor_store.name}</h4><p><b>Address:</b> #{liquor_store.address}</p><p><b>Phone:</b> #{liquor_store.phone}</p>"
      marker.json({
        name:     liquor_store.name,
        address: liquor_store.address
      })
    end
  end

  # GET /liquor_stores/new
  def new
    @liquor_store = LiquorStore.new
  end

  # GET /liquor_stores/1/edit
  def edit
  end

  # POST /liquor_stores
  # POST /liquor_stores.json
  def create
    @liquor_store = LiquorStore.new(liquor_store_params)

    respond_to do |format|
      if @liquor_store.save
        format.html { redirect_to @liquor_store, notice: 'Liquor store was successfully created.' }
        format.json { render :show, status: :created, location: @liquor_store }
      else
        format.html { render :new }
        format.json { render json: @liquor_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquor_stores/1
  # PATCH/PUT /liquor_stores/1.json
  def update
    respond_to do |format|
      if @liquor_store.update(liquor_store_params)
        format.html { redirect_to @liquor_store, notice: 'Liquor store was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquor_store }
      else
        format.html { render :edit }
        format.json { render json: @liquor_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquor_stores/1
  # DELETE /liquor_stores/1.json
  def destroy
    @liquor_store.destroy
    respond_to do |format|
      format.html { redirect_to liquor_stores_url, notice: 'Liquor store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquor_store
      @liquor_store = LiquorStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquor_store_params
      params.require(:liquor_store).permit(:name, :address, :phone, :website, :hours_monday, :hours_tuesday, :hours_wednesday, :hours_thursday, :hours_friday, :hours_saturday, :hours_sunday, :delivery, :latitude, :longitude, :facebook, :twitter, :instagram)
    end
    
    
end
