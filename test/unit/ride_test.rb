require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "this weeks route" do
    ride = Ride.find_this_weeks_ride
    assert 'Traditional route', ride.name
  end
end
