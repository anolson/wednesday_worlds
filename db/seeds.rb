this_wednesday = Date.current.beginning_of_week + 2.days
next_wednesday = (Date.current + 1.week).beginning_of_week + 2.days

ww = Ride.create(
  :name => 'Wednesday Worlds',
  :location => 'Bollo\'s',
  :currently_active => true)

bburg_road_copy = <<-BBURG
Out and back on Blackburg Rd

From Bollo's, we head down Ellet/Cedar Run and across Luster's Gate Rd. We re-group at the intersection of Blacksburg Rd, where the B group is given a head start (~ 1 min).

The first sprint is at Sandy Ridge. We re-group again there and head back in on Blacksburg Rd.

The next sprint is at Dry Run Rd. Finally, we finish at the top of Harding.
BBURG

bburg_road = Route.create(
  name: 'Blacksburg road',
  description: bburg_road_copy,
  map_url: 'http://bit.ly/bCG3Lf')

Event.create(:begins_at => "#{this_wednesday} 18:00", ride: ww, route: bburg_road)

tabor_copy = <<-TABOR
Out Tabor Rd, back on Blackburg Rd

From Bollo's, we head out N. Main St to Mt Tabor Rd. We re-group at Slusser's Chapel, where the B group is given a head start (~2-3 mins).

We ride out Mt Tabor Rd and make a right turn onto Sandy Ridge Rd.

The only sprint is at Dry Run Rd.  Finally, we finish at the top of Harding.
TABOR

tabor = Route.create(
  name: 'Mt Tabor road',
  description: tabor_copy,
  map_url: 'http://bit.ly/bSpQAT')

Event.create(:begins_at => "#{next_wednesday} 18:00", ride: ww, route: tabor)

Administrator.create(:name => 'Andrew Olson', :twitter_screen_name => 'andrew_olson')

EmailNotifier.create(:recipient => 'anolson@gmail.com', ride: ww)
