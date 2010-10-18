require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "find current ride" do
    ride = Ride.find_by_currently_active(true)
    assert_equal 'Wednesday Worlds', ride.name
  end
  
  test "this weeks route" do
    ride = Ride.find_by_currently_active(true)
    assert_equal 'Tabor loop', ride.this_weeks_route.name
  end
  
  test "this weeks route expired" do
    ride = Ride.find(3)
    assert_equal nil, ride.this_weeks_route
  end
  
end
