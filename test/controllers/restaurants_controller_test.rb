require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address: @restaurant.address, facebook: @restaurant.facebook, friday_hours: @restaurant.friday_hours, instagram: @restaurant.instagram, monday_hours: @restaurant.monday_hours, name: @restaurant.name, order_online: @restaurant.order_online, phone_number: @restaurant.phone_number, saturday_hours: @restaurant.saturday_hours, sunday_hours: @restaurant.sunday_hours, thursday_hours: @restaurant.thursday_hours, tuesday_hours: @restaurant.tuesday_hours, twitter: @restaurant.twitter, website: @restaurant.website, wednesday_hours: @restaurant.wednesday_hours }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { address: @restaurant.address, facebook: @restaurant.facebook, friday_hours: @restaurant.friday_hours, instagram: @restaurant.instagram, monday_hours: @restaurant.monday_hours, name: @restaurant.name, order_online: @restaurant.order_online, phone_number: @restaurant.phone_number, saturday_hours: @restaurant.saturday_hours, sunday_hours: @restaurant.sunday_hours, thursday_hours: @restaurant.thursday_hours, tuesday_hours: @restaurant.tuesday_hours, twitter: @restaurant.twitter, website: @restaurant.website, wednesday_hours: @restaurant.wednesday_hours }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
