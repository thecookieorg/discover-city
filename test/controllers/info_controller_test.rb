require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

  test "should get culture" do
    get :culture
    assert_response :success
  end

end
