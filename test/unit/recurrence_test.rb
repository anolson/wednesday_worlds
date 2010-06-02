require 'test_helper'

class RecurrenceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "previous recurrence does not occur this week" do
    recurrence = Recurrence.find(2)
    assert_same false, recurrence.occurs_this_week?
    assert_nil recurrence.this_weeks_date
  end
  
  test "current recurrence occurs this week" do
    recurrence =  Recurrence.find(1)
    assert recurrence.occurs_this_week?
    assert_equal '06:00', recurrence.starts_at.utc.strftime("%I:%M")
  end
end
