require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:wednesday_worlds)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should show ride" do
    get :show, :id => @ride.to_param
    assert_response :success
  end
  
end
