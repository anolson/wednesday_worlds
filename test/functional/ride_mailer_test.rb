require 'test_helper'

class RideMailerTest < ActionMailer::TestCase
  # replace this with your real tests
  test "week ride email" do
    email = RideMailer.deliver
  end
end
