this_wednesday = Date.current.beginning_of_week + 2.days
next_wednesday = (Date.current + 1.week).beginning_of_week + 2.days

ww = Ride.create(
  :name => 'Wednesday Worlds',
  :location => 'Bollo\'s',
  :currently_active => true)

bburg_copy = <<-BBURG
Out and back on Blackburg Rd

From Bollo's, we head down Ellet/Cedar Run and across Luster's Gate Rd. We re-group at the intersection of Blacksburg Rd, where the B group is given a head start (~ 1 min).

The first sprint is at Sandy Ridge. We re-group again there and head back in on Blacksburg Rd.

The next sprint is at Dry Run Rd. Finally, we finish at the top of Harding.
BBURG

blacksburg_road = Route.create(
  :name => 'Blacksburg road',
  :description => bburg_copy,
  :map_url => 'http://bit.ly/bCG3Lf',
  :ride => ww)

blacksburg_road_occurrence = Occurrence.create(
  :recurs => true,
  :recurrence_type => 'bi-weekly',
  :recurrence_ends_at => "#{this_wednesday + 8.weeks}",
  :begins_at => "#{this_wednesday} 18:00",
  :route => blacksburg_road);

tabor_copy = <<-TABOR
Out Tabor Rd, back on Blackburg Rd

From Bollo's, we head out N. Main St to Mt Tabor Rd. We re-group at Slusser's Chapel, where the B group is given a head start (~2-3 mins).

We ride out Mt Tabor Rd and make a right turn onto Sandy Ridge Rd.

The only sprint is at Dry Run Rd.  Finally, we finish at the top of Harding.
TABOR

tabor = Route.create(
  :name => 'Mt Tabor road',
  :description => tabor_copy,
  :map_url => 'http://bit.ly/bSpQAT',
  :ride => ww)

tabor_occurrence = Occurrence.create(
  :recurs => true,
  :recurrence_type => 'bi-weekly',
  :recurrence_ends_at => "#{next_wednesday + 8.weeks}",
  :begins_at => "#{next_wednesday} 18:00",
  :route => tabor)

Administrator.create(:name => 'Andrew Olson', :twitter_screen_name => 'andrew_olson')
EmailNotifier.create(:recipient => 'anolson@gmail.com') do |notifier|
  notifier.ride = ww
end


#
# andrew_gold = Ride.create(
#   :name => 'Andrew Gold',
#   :location => 'Bollo\'s',
#   :currently_active => false)
#
# andrew_gold_route = Route.create(
#   :name => 'Andrew Gold route',
#   :description => 'Out Blacksburg Rd, finish at the Blacksburg Town sign on Mt Tabor Rd',
#   :map_url => 'http://bit.ly/bSpQAT',
#   :ride => andrew_gold)
#
# andrew_gold_occurrence = Occurrence.create(
#   :recurs => false,
#   :begins_at => '2011-01-22 10:00',
#   :route => andrew_gold_route)
#
# owen_cup = Ride.create(
#   :name => 'Andrew Gold',
#   :location => 'Bollo\'s',
#   :currently_active => false)
#
# owen_cup_occurrence = Occurrence.create(
#   :recurs => false,
#   :begins_at => '2011-01-29 10:00',
#   :route => owen_cup_route)
#
# owen_cup_route = Route.create(
#   :name => 'Andrew Gold route',
#   :description => 'Out Mt Tabor Rd, back Blacksburg Rd (3x).  Finish at the top of Harding',
#   :map_url => 'http://bit.ly/bSpQAT',
#   :ride => owen_cup)
