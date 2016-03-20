require 'test_helper'

class LiquorStoresControllerTest < ActionController::TestCase
  setup do
    @liquor_store = liquor_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquor_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquor_store" do
    assert_difference('LiquorStore.count') do
      post :create, liquor_store: { address: @liquor_store.address, delivery: @liquor_store.delivery, hours_friday: @liquor_store.hours_friday, hours_monday: @liquor_store.hours_monday, hours_saturday: @liquor_store.hours_saturday, hours_sunday: @liquor_store.hours_sunday, hours_thursday: @liquor_store.hours_thursday, hours_tuesday: @liquor_store.hours_tuesday, hours_wednesday: @liquor_store.hours_wednesday, latitude: @liquor_store.latitude, longitude: @liquor_store.longitude, name: @liquor_store.name, phone: @liquor_store.phone, website: @liquor_store.website }
    end

    assert_redirected_to liquor_store_path(assigns(:liquor_store))
  end

  test "should show liquor_store" do
    get :show, id: @liquor_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquor_store
    assert_response :success
  end

  test "should update liquor_store" do
    patch :update, id: @liquor_store, liquor_store: { address: @liquor_store.address, delivery: @liquor_store.delivery, hours_friday: @liquor_store.hours_friday, hours_monday: @liquor_store.hours_monday, hours_saturday: @liquor_store.hours_saturday, hours_sunday: @liquor_store.hours_sunday, hours_thursday: @liquor_store.hours_thursday, hours_tuesday: @liquor_store.hours_tuesday, hours_wednesday: @liquor_store.hours_wednesday, latitude: @liquor_store.latitude, longitude: @liquor_store.longitude, name: @liquor_store.name, phone: @liquor_store.phone, website: @liquor_store.website }
    assert_redirected_to liquor_store_path(assigns(:liquor_store))
  end

  test "should destroy liquor_store" do
    assert_difference('LiquorStore.count', -1) do
      delete :destroy, id: @liquor_store
    end

    assert_redirected_to liquor_stores_path
  end
end
