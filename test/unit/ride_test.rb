require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "find current ride" do
    ride = Ride.find_by_currently_active(true)
    assert_equal 'Wednesday Worlds', ride.name
  end
end
