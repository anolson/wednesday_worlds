require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:wednesday_worlds)
    @route = routes(:tabor)
  end

  test "should get index" do
    get :index, :controller => 'routes', :ride_id => @ride.id
    assert_response :success
    assert_not_nil assigns(:routes)
  end

  test "should show route" do
    get :show, :controller => 'routes', :ride_id => @ride.id, :id => @route.to_param
    assert_response :success
  end
  
end
