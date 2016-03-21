require 'test_helper'

class AccommodationsControllerTest < ActionController::TestCase
  setup do
    @accommodation = accommodations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accommodations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post :create, accommodation: { accessible: @accommodation.accessible, air_conditioned: @accommodation.air_conditioned, airport_shuttle: @accommodation.airport_shuttle, bar: @accommodation.bar, breakfast: @accommodation.breakfast, child_friendly: @accommodation.child_friendly, description: @accommodation.description, free_wi_fi: @accommodation.free_wi_fi, gym: @accommodation.gym, hot_tub: @accommodation.hot_tub, latitude: @accommodation.latitude, laundry_service: @accommodation.laundry_service, longitude: @accommodation.longitude, name: @accommodation.name, parking: @accommodation.parking, pets_allowed: @accommodation.pets_allowed, pool: @accommodation.pool, price_per_night: @accommodation.price_per_night, restaurant: @accommodation.restaurant, smoke_free: @accommodation.smoke_free, spa: @accommodation.spa }
    end

    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  test "should show accommodation" do
    get :show, id: @accommodation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accommodation
    assert_response :success
  end

  test "should update accommodation" do
    patch :update, id: @accommodation, accommodation: { accessible: @accommodation.accessible, air_conditioned: @accommodation.air_conditioned, airport_shuttle: @accommodation.airport_shuttle, bar: @accommodation.bar, breakfast: @accommodation.breakfast, child_friendly: @accommodation.child_friendly, description: @accommodation.description, free_wi_fi: @accommodation.free_wi_fi, gym: @accommodation.gym, hot_tub: @accommodation.hot_tub, latitude: @accommodation.latitude, laundry_service: @accommodation.laundry_service, longitude: @accommodation.longitude, name: @accommodation.name, parking: @accommodation.parking, pets_allowed: @accommodation.pets_allowed, pool: @accommodation.pool, price_per_night: @accommodation.price_per_night, restaurant: @accommodation.restaurant, smoke_free: @accommodation.smoke_free, spa: @accommodation.spa }
    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete :destroy, id: @accommodation
    end

    assert_redirected_to accommodations_path
  end
end
