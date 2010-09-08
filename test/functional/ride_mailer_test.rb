require 'test_helper'

class RideMailerTest < ActionMailer::TestCase
  # replace this with your real tests
  test "week ride email" do
    ride = Ride.find_by_currently_active(true)
    email = RideMailer.weekly_ride_email(ride).deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal ["vt_cycling@listserv.vt.edu"], email.to
  end
end
