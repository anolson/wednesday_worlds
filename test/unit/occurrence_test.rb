require 'test_helper'

class OccurrenceTest < ActiveSupport::TestCase
  test "previous occurrence does not occur this week" do
    occurrence = Occurrence.find(4)
    assert !occurrence.this_week?
  end
  
  test "current occurrence occurs this week" do
    occurrence =  Occurrence.find(1)
    assert occurrence.this_week?
    assert_equal '12:00', occurrence.begins_at.strftime("%I:%M")
    assert occurrence.this_week
  end
  
  test "weekly occurrence dates" do
     occurrence = Occurrence.find(2)
     assert_equal 5, occurrence.dates.size
     assert occurrence.dates.include?(Time.parse("2010-06-02 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-09 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-16 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-23 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-30 18:00 UTC"))
   end
   
   test "biweekly occurrence dates" do
     occurrence = Occurrence.find(3)
     assert_equal 3, occurrence.dates.size 
     assert occurrence.dates.include?(Time.parse("2010-06-02 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-16 18:00 UTC"))
     assert occurrence.dates.include?(Time.parse("2010-06-30 18:00 UTC"))
   end
   
   test "single occurrence" do
     occurrence = Occurrence.find(5)
     assert !occurrence.recurs?
     assert_equal 1, occurrence.dates.size
     assert_equal '2010-05-05 18:00', occurrence.dates.first.strftime("%Y-%m-%d %H:%M")
   end
   
   test "next weeks occurrence" do
     occurrence = Occurrence.find(7)
     assert !occurrence.this_week?
     assert occurrence.next_week?
   end
   
   test "a future occurrence" do
     occurrence = Occurrence.find(8)
     assert !occurrence.this_week?
     assert !occurrence.next_week?
     assert occurrence.later?
   end
   
end
